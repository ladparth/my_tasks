import 'package:flutter/material.dart';
import 'package:my_tasks/features/task/presentation/provider/task_provider.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatelessWidget {
  final String listId;
  const ProgressBar({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProvider>();
    final tasks = provider.tasks;
    final tasksInList = tasks.where((task) => task.listId == listId);
    final completedTasks = tasksInList.where((task) => task.isCompleted).length;
    final totalTasks = tasksInList.length;
    final double progress = totalTasks == 0 ? 0 : completedTasks / totalTasks;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          minHeight: 10,
          value: progress,
          borderRadius: BorderRadius.circular(8),
          backgroundColor: Theme.of(context).colorScheme.surface,
          valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary),
        ),
        SizedBox(height: 8),
        Text(
          totalTasks == 0
              ? 'No tasks yet. Start by adding one!'
              : '$completedTasks of $totalTasks tasks completed',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ],
    );
  }
}
