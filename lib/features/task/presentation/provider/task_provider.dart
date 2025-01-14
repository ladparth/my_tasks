import 'package:flutter/material.dart';
import 'package:my_tasks/features/task/data/models/task_model.dart';
import 'package:my_tasks/features/task/domain/entities/task_entity.dart';
import 'package:my_tasks/features/task/domain/usecases/add_task.dart';
import 'package:my_tasks/features/task/domain/usecases/get_tasks.dart';
import 'package:my_tasks/features/task/domain/usecases/remove_task.dart';
import 'package:my_tasks/features/task/domain/usecases/update_task.dart';
import 'package:uuid/uuid.dart';

class TaskProvider extends ChangeNotifier {
  final AddTask _addTask;
  final UpdateTask _updateTask;
  final GetTasks _getTasks;
  final RemoveTask _removeTask;

  final Uuid _uuid = Uuid();

  TaskProvider(
      this._addTask, this._updateTask, this._getTasks, this._removeTask) {
    _init();
  }

  List<TaskEntity> _tasks = [];

  List<TaskEntity> get tasks => _tasks;

  Future<void> _init() async {
    await getTasks();
  }

  Future<void> getTasks() async {
    try {
      final tasks = await _getTasks();
      _tasks = tasks;
      notifyListeners();
    } catch (e) {
      print("Error getting tasks: $e");
    }
  }

  Future<void> addTask(TaskEntity task) async {
    try {
      final TaskModel taskModel = TaskModel(
          id: _uuid.v4(),
          listId: task.listId,
          title: task.title,
          description: task.description,
          isCompleted: task.isCompleted,
          isFavorite: task.isFavorite);
      await _addTask(taskModel);
      _tasks.add(taskModel);
      notifyListeners();
    } catch (e) {
      print("Error adding task: $e");
    }
  }

  Future<void> removeTask(String id) async {
    try {
      _tasks.removeWhere((element) => element.id == id);
      await _removeTask(id);
      notifyListeners();
    } catch (e) {
      print("Error removing task: $e");
    }
  }

  Future<void> updateTask(TaskEntity task) async {
    try {
      final index = _tasks.indexWhere((element) => element.id == task.id);
      final TaskModel updatedTask = TaskModel(
          id: task.id,
          listId: task.listId,
          title: task.title,
          description: task.description,
          isCompleted: task.isCompleted,
          isFavorite: task.isFavorite);
      _tasks[index] = updatedTask;
      await _updateTask(updatedTask);
      notifyListeners();
    } catch (e) {
      print("Error updating task: $e");
    }
  }
}
