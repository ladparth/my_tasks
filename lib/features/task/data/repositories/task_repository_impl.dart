import 'package:my_tasks/features/task/data/datasources/local/task_local_datasource.dart';
import 'package:my_tasks/features/task/data/models/task_model.dart';
import 'package:my_tasks/features/task/domain/entities/task_entity.dart';
import 'package:my_tasks/features/task/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDatasource localDatasource;

  TaskRepositoryImpl(this.localDatasource);

  @override
  Future<void> addTask(TaskEntity task) async {
    final tasks = await localDatasource.getTasks();
    final taskModel = TaskModel(
        id: task.id,
        listId: task.listId,
        title: task.title,
        description: task.description,
        isCompleted: task.isCompleted,
        isFavorite: task.isFavorite);
    tasks.add(taskModel);
    await localDatasource.saveTasks(tasks);
  }

  @override
  Future<void> removeTask(String id) async {
    final tasks = await localDatasource.getTasks();
    tasks.removeWhere((element) => element.id == id);
    await localDatasource.saveTasks(tasks);
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    final tasks = await localDatasource.getTasks();
    return tasks;
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final tasks = await localDatasource.getTasks();
    final taskIndex = tasks.indexWhere((element) => element.id == task.id);
    tasks[taskIndex] = TaskModel(
        id: task.id,
        listId: task.listId,
        title: task.title,
        description: task.description,
        isCompleted: task.isCompleted,
        isFavorite: task.isFavorite);
    await localDatasource.saveTasks(tasks);
  }
}
