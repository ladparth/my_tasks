import 'package:my_tasks/features/task/domain/repositories/task_repository.dart';

class ToggleTaskFavorite {
  final TaskRepository _taskRepository;

  ToggleTaskFavorite(this._taskRepository);

  Future<void> call(String id) async {
    return await _taskRepository.toggleTaskFavorite(id);
  }
}
