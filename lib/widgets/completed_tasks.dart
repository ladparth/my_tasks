import 'package:flutter/material.dart';
import 'package:my_tasks/providers/task_provider.dart';
import 'package:my_tasks/widgets/task_items/task_items.dart';
import 'package:provider/provider.dart';

class CompletedTask extends StatelessWidget {
  CompletedTask({super.key});
  final RoundedRectangleBorder roundedRectBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide.none,
  );
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final completeTasks = taskProvider.getCompletedTasks();

    return Card(
      shape: roundedRectBorder,
      child: ExpansionTile(
        collapsedShape: roundedRectBorder,
        shape: roundedRectBorder,
        title: Text('Completed Tasks (${completeTasks.length})'),
        children: [
          TaskListView(tasks: completeTasks),
        ],
      ),
    );
  }
}
