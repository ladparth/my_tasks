import 'package:my_tasks/features/task/domain/usecases/add_task.dart';
import 'package:my_tasks/features/task/domain/usecases/get_tasks.dart';
import 'package:my_tasks/features/task/domain/usecases/remove_task.dart';
import 'package:my_tasks/features/task/domain/usecases/remove_tasks_by_list_id.dart';
import 'package:my_tasks/features/task/domain/usecases/toggle_task_favorite.dart';
import 'package:my_tasks/features/task/domain/usecases/toggle_task_status.dart';
import 'package:my_tasks/features/task/domain/usecases/update_task.dart';
import 'package:my_tasks/features/task/presentation/provider/task_provider.dart';
import 'package:my_tasks/features/task/data/datasources/local/task_local_datasource.dart';
import 'package:my_tasks/features/task/data/repositories/task_repository_impl.dart';

class TaskDi {
  final TaskLocalDatasource _taskLocalDatasource = TaskLocalDatasource();
  late final TaskRepositoryImpl _taskRepositoryImpl;
  late final AddTask _addTask;
  late final GetTasks _getTasks;
  late final RemoveTask _removeTask;
  late final UpdateTask _updateTask;
  late final ToggleTaskStatus _toggleTaskStatus;
  late final ToggleTaskFavorite _toggleTaskFavorite;
  late final RemoveTasksByListId _removeTasksByListId;
  late final TaskProvider _taskProvider;

  TaskDi() {
    _taskRepositoryImpl = TaskRepositoryImpl(_taskLocalDatasource);
    _addTask = AddTask(_taskRepositoryImpl);
    _getTasks = GetTasks(_taskRepositoryImpl);
    _removeTask = RemoveTask(_taskRepositoryImpl);
    _updateTask = UpdateTask(_taskRepositoryImpl);
    _toggleTaskStatus = ToggleTaskStatus(_taskRepositoryImpl);
    _toggleTaskFavorite = ToggleTaskFavorite(_taskRepositoryImpl);
    _removeTasksByListId = RemoveTasksByListId(_taskRepositoryImpl);
    _taskProvider = TaskProvider(_addTask, _updateTask, _getTasks, _removeTask,
        _toggleTaskStatus, _toggleTaskFavorite, _removeTasksByListId);
  }

  TaskProvider get taskProvider => _taskProvider;
}
