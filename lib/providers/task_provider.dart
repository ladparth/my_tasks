import 'package:flutter/material.dart';
import 'package:my_tasks/models/task.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TaskProvider with ChangeNotifier {
  final List<TaskList> _taskLists = [];
  final Uuid _uuid = Uuid();
  TaskList? _selectedTaskList;

  TaskProvider() {
    _initializeData();
  }

  Future<void> _initializeData() async {
    final prefs = await SharedPreferences.getInstance();
    final taskListsString = prefs.getString('taskLists');
    final selectedTaskListId = prefs.getString('selectedTaskListId');

    if (taskListsString != null) {
      final decodedTaskLists = jsonDecode(taskListsString) as List;
      _taskLists.addAll(
        decodedTaskLists.map((taskList) => TaskList.fromJson(taskList)),
      );
      if (_taskLists.isNotEmpty) {
        _selectedTaskList = _taskLists.firstWhere(
          (list) => list.id == selectedTaskListId,
          orElse: () => _taskLists.first,
        );
      }
    } else {
      // Add default task lists
      _taskLists.add(TaskList(id: _uuid.v4(), name: 'My Tasks'));
      _selectedTaskList = _taskLists.first;
      await _saveData();
    }
    notifyListeners();
  }

  Future<void> _saveSelectedTaskListId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedTaskListId', id);
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedTaskLists =
        jsonEncode(_taskLists.map((taskList) => taskList.toJson()).toList());
    prefs.setString('taskLists', encodedTaskLists);
  }

  List<TaskList> get taskLists => _taskLists;
  TaskList? get selectedTaskList => _selectedTaskList;

  void addTaskList(String name) {
    final id = _uuid.v4();
    _taskLists.add(TaskList(id: id, name: name));
    setSelectedTaskList(id);
    _saveData();
    notifyListeners();
  }

  void updateTaskList(String id, String newName) {
    final index = _taskLists.indexWhere((list) => list.id == id);
    if (index != -1) {
      _taskLists[index] = TaskList(
        id: id,
        name: newName,
        tasks: _taskLists[index].tasks,
      );
      _saveData();
      notifyListeners();
    }
  }

  void deleteTaskList(String id) {
    _taskLists.removeWhere((list) => list.id == id);
    _saveData();
    notifyListeners();
  }

  void addTask(String taskListId, Task task) {
    final taskList = _taskLists.firstWhere((list) => list.id == taskListId);

    taskList.tasks.add(
      Task(
        id: _uuid.v4(),
        title: task.title,
        description: task.description,
        dueDate: task.dueDate,
        isCompleted: task.isCompleted,
        isFavorite: task.isFavorite,
        subtasks: task.subtasks,
      ),
    );
    _saveData();
    notifyListeners();
  }

  void updateTask(String taskListId, Task updatedTask) {
    final taskList = _taskLists.firstWhere((list) => list.id == taskListId);
    final index =
        taskList.tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      taskList.tasks[index] = updatedTask;
      _saveData();
      notifyListeners();
    }
  }

  void toggleIsCompleted(String taskListId, String taskId) {
    final taskList = _taskLists.firstWhere((list) => list.id == taskListId);
    final task = taskList.tasks.firstWhere((task) => task.id == taskId);
    task.isCompleted = !task.isCompleted;
    updateTask(taskListId, task);
  }

  void toggleIsFavorite(String taskListId, String taskId) {
    final taskList = _taskLists.firstWhere((list) => list.id == taskListId);
    final task = taskList.tasks.firstWhere((task) => task.id == taskId);
    task.isFavorite = !task.isFavorite;
    updateTask(taskListId, task);
  }

  void deleteTask(String taskListId, String taskId) {
    final taskList = _taskLists.firstWhere((list) => list.id == taskListId);
    taskList.tasks.removeWhere((task) => task.id == taskId);
    _saveData();
    notifyListeners();
  }

  void addSubTask(String taskListId, String taskId, SubTask subTask) {
    final task = _taskLists
        .firstWhere((list) => list.id == taskListId)
        .tasks
        .firstWhere((task) => task.id == taskId);
    task.subtasks.add(
      SubTask(
        id: _uuid.v4(),
        title: subTask.title,
        isCompleted: subTask.isCompleted,
      ),
    );
    _saveData();
    notifyListeners();
  }

  void updateSubTask(String taskListId, String taskId, SubTask updatedSubTask) {
    final task = _taskLists
        .firstWhere((list) => list.id == taskListId)
        .tasks
        .firstWhere((task) => task.id == taskId);
    final index =
        task.subtasks.indexWhere((sub) => sub.id == updatedSubTask.id);
    if (index != -1) {
      task.subtasks[index] = updatedSubTask;
      _saveData();
      notifyListeners();
    }
  }

  void deleteSubTask(String taskListId, String taskId, String subTaskId) {
    final task = _taskLists
        .firstWhere((list) => list.id == taskListId)
        .tasks
        .firstWhere((task) => task.id == taskId);
    task.subtasks.removeWhere((sub) => sub.id == subTaskId);
    _saveData();
    notifyListeners();
  }

  void setSelectedTaskList(String id) {
    _selectedTaskList = _taskLists.firstWhere(
      (list) => list.id == id,
      orElse: () => _taskLists.firstWhere((list) => list.name == 'My Tasks'),
    );
    _saveSelectedTaskListId(id);
    _saveData();
    notifyListeners();
  }

  List<Task> getFavoriteTasks() {
    List<Task> favoriteTasks = [];
    for (var taskList in _taskLists) {
      for (var task in taskList.tasks) {
        if (task.isFavorite) {
          favoriteTasks.add(task);
        }
      }
    }
    return favoriteTasks;
  }

  List<Task> getCompletedTasks() {
    return _selectedTaskList?.tasks
            .where((task) => task.isCompleted)
            .toList() ??
        [];
  }

  List<Task> getIncompleteTasks() {
    return _selectedTaskList?.tasks
            .where((task) => !task.isCompleted)
            .toList() ??
        [];
  }

  void moveTask(String fromTaskListId, String toTaskListId, String taskId) {
    final fromTaskList =
        _taskLists.firstWhere((list) => list.id == fromTaskListId);
    final toTaskList = _taskLists.firstWhere((list) => list.id == toTaskListId);

    final task = fromTaskList.tasks.firstWhere((task) => task.id == taskId);
    fromTaskList.tasks.remove(task);
    toTaskList.tasks.add(task);

    _saveData();
    notifyListeners();
  }
}
