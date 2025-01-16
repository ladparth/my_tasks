import 'package:flutter/material.dart';
import 'package:my_tasks/features/task/domain/entities/task_entity.dart';
import 'package:my_tasks/features/task/presentation/widgets/task_item.dart';

class TaskListView extends StatelessWidget {
  final List<TaskEntity> tasks;
  const TaskListView({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 5),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          task: tasks[index],
        );
      },
    );
  }
}
