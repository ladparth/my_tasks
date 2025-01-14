import 'package:my_tasks/features/list/di/list_di.dart';
import 'package:my_tasks/features/task/di/task_di.dart';

class AppDi {
  static final listProvider = ListDi().listProvider;
  static final taskProvider = TaskDi().taskProvider;
}
