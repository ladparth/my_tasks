import 'package:my_tasks/features/task/domain/entities/task_entity.dart';
import 'package:my_tasks/features/task/domain/repositories/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<List<TaskEntity>> call() async {
    return await repository.getTasks();
  }
}
