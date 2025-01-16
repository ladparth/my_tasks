import 'package:my_tasks/features/task/domain/repositories/task_repository.dart';

class ToggleTaskStatus {
  final TaskRepository _taskRepository;

  ToggleTaskStatus(this._taskRepository);

  Future<void> call(String id) async {
    return await _taskRepository.toggleTaskStatus(id);
  }
}
