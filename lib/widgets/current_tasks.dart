import 'package:flutter/material.dart';
import 'package:my_tasks/providers/task_provider.dart';
import 'package:my_tasks/widgets/task_items/task_items.dart';
import 'package:provider/provider.dart';

class CurrentTasks extends StatelessWidget {
  const CurrentTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final inCompleteTasks = taskProvider.getIncompleteTasks();
    final taskCount = inCompleteTasks.length;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: taskCount == 0
          ? SizedBox(
              width: double.infinity,
              height: 400,
              child: Center(
                child: Text(
                  'No tasks available',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TaskListView(tasks: inCompleteTasks),
            ),
    );
  }
}
