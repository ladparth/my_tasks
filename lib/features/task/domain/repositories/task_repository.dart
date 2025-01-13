import 'package:my_tasks/features/task/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<void> addTask(TaskEntity task);
  Future<void> removeTask(String id);
  Future<void> updateTask(TaskEntity task);
}
