import 'package:my_tasks/features/task/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<void> addTask(TaskEntity task);
  Future<void> removeTask(String id);
  Future<void> updateTask(TaskEntity task);
  Future<void> toggleTaskStatus(String id);
  Future<void> toggleTaskFavorite(String id);
  Future<List<TaskEntity>> getTasksByListId(String listId);
  Future<void> removeTasksByListId(String listId);
  Future<List<TaskEntity>> getCompletedTasks(String listId);
  Future<List<TaskEntity>> getPendingTasks(String listId);
}
