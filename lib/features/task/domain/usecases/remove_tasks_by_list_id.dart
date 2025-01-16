import 'package:my_tasks/features/task/domain/repositories/task_repository.dart';

class RemoveTasksByListId {
  final TaskRepository _taskRepository;

  RemoveTasksByListId(this._taskRepository);

  Future<void> call(String listId) async {
    return _taskRepository.removeTasksByListId(listId);
  }
}
