import 'package:my_tasks/features/task/domain/entities/task_entity.dart';
import 'package:my_tasks/features/task/domain/repositories/task_repository.dart';

class UpdateTask {
  final TaskRepository _taskRepository;

  UpdateTask(this._taskRepository);

  Future<void> call(TaskEntity task) async {
    return await _taskRepository.updateTask(task);
  }
}
