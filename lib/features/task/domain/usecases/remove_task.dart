import 'package:my_tasks/features/task/domain/repositories/task_repository.dart';

class RemoveTask {
  final TaskRepository _taskRepository;

  RemoveTask(this._taskRepository);

  Future<void> call(String id) async {
    return await _taskRepository.removeTask(id);
  }
}
