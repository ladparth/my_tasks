import 'package:flutter/material.dart';
import 'package:my_tasks/models/task.dart';
import 'package:uuid/uuid.dart';

class TaskProvider with ChangeNotifier {
  final List<TaskList> _taskLists = [];
  final Uuid _uuid = Uuid();
  late TaskList _selectedTaskList;

  TaskProvider() {
    // Add default task lists
    _taskLists.add(TaskList(id: _uuid.v4(), name: 'My Tasks'));

    // Set the selected task list to the first one
    _selectedTaskList = _taskLists.first;
  }

  List<TaskList> get taskLists => _taskLists;
  TaskList? get selectedTaskList => _selectedTaskList;

  // Add a new task list
  void addTaskList(String name) {
    final id = _uuid.v4();
    _taskLists.add(TaskList(id: id, name: name));
    setSelectedTaskList(id);
    notifyListeners();
  }

  // Update a task list
  void updateTaskList(String id, String newName) {
    final index = _taskLists.indexWhere((list) => list.id == id);
    if (index != -1) {
      _taskLists[index] = TaskList(
        id: id,
        name: newName,
        tasks: _taskLists[index].tasks,
      );
      notifyListeners();
    }
  }

  // Delete a task list
  void deleteTaskList(String id) {
    _taskLists.removeWhere((list) => list.id == id);
    notifyListeners();
  }

  // Add a task to a task list
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
    notifyListeners();
  }

  // Update a task
  void updateTask(String taskListId, Task updatedTask) {
    final taskList = _taskLists.firstWhere((list) => list.id == taskListId);
    final index =
        taskList.tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      taskList.tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  // Toggle isCompleted for a task
  void toggleIsCompleted(String taskListId, String taskId) {
    final taskList = _taskLists.firstWhere((list) => list.id == taskListId);
    final task = taskList.tasks.firstWhere((task) => task.id == taskId);
    task.isCompleted = !task.isCompleted;
    updateTask(taskListId, task);
  }

  // Toggle isFavorite for a task
  void toggleIsFavorite(String taskListId, String taskId) {
    final taskList = _taskLists.firstWhere((list) => list.id == taskListId);
    final task = taskList.tasks.firstWhere((task) => task.id == taskId);
    task.isFavorite = !task.isFavorite;
    updateTask(taskListId, task);
  }

  // Delete a task
  void deleteTask(String taskListId, String taskId) {
    final taskList = _taskLists.firstWhere((list) => list.id == taskListId);
    taskList.tasks.removeWhere((task) => task.id == taskId);
    notifyListeners();
  }

  // Add a subtask to a task
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
    notifyListeners();
  }

  // Update a subtask
  void updateSubTask(String taskListId, String taskId, SubTask updatedSubTask) {
    final task = _taskLists
        .firstWhere((list) => list.id == taskListId)
        .tasks
        .firstWhere((task) => task.id == taskId);
    final index =
        task.subtasks.indexWhere((sub) => sub.id == updatedSubTask.id);
    if (index != -1) {
      task.subtasks[index] = updatedSubTask;
      notifyListeners();
    }
  }

  // Delete a subtask
  void deleteSubTask(String taskListId, String taskId, String subTaskId) {
    final task = _taskLists
        .firstWhere((list) => list.id == taskListId)
        .tasks
        .firstWhere((task) => task.id == taskId);
    task.subtasks.removeWhere((sub) => sub.id == subTaskId);
    notifyListeners();
  }

  // Set the selected task list
  void setSelectedTaskList(String id) {
    _selectedTaskList = _taskLists.firstWhere(
      (list) => list.id == id,
      orElse: () => _taskLists.firstWhere((list) => list.name == 'My Tasks'),
    );
    notifyListeners();
  }

  // Get a list of favorite tasks from all task lists
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

  // Get a list of completed tasks from all task lists
  List<Task> getCompletedTasks() {
    return _selectedTaskList.tasks.where((task) => task.isCompleted).toList();
  }

  // Get a list of incomplete tasks from all task lists
  List<Task> getIncompleteTasks() {
    return _selectedTaskList.tasks.where((task) => !task.isCompleted).toList();
  }

  // Move a task from one task list to another
  void moveTask(String fromTaskListId, String toTaskListId, String taskId) {
    final fromTaskList =
        _taskLists.firstWhere((list) => list.id == fromTaskListId);
    final toTaskList = _taskLists.firstWhere((list) => list.id == toTaskListId);

    final task = fromTaskList.tasks.firstWhere((task) => task.id == taskId);
    fromTaskList.tasks.remove(task);
    toTaskList.tasks.add(task);

    notifyListeners();
  }
}
