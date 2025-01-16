import 'package:my_tasks/features/task/domain/entities/task_entity.dart';
import 'package:my_tasks/features/task/domain/repositories/task_repository.dart';

class GetTasksByListId {
  final TaskRepository _taskRepository;

  GetTasksByListId(this._taskRepository);

  Future<List<TaskEntity>> call(String listId) async {
    return await _taskRepository.getTasksByListId(listId);
  }
}
