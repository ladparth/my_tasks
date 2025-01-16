import 'package:my_tasks/features/task/domain/entities/task_entity.dart';
import 'package:my_tasks/features/task/domain/repositories/task_repository.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<void> call(TaskEntity task) async {
    return repository.addTask(task);
  }
}
