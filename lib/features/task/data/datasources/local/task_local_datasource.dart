import 'dart:convert';
import 'package:my_tasks/features/task/data/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskLocalDatasource {
  Future<List<TaskModel>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasks = prefs.getStringList('tasks');

    if (tasks == null) {
      return [];
    }

    return tasks.map((task) => TaskModel.fromJson(jsonDecode(task))).toList();
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks.map((task) => jsonEncode(task.toJson())).toList();

    prefs.setStringList('tasks', tasksJson);
  }
}
