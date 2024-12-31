import 'package:flutter/material.dart';
import 'package:my_tasks/widgets/task_items/task_items.dart';

class CurrentTasks extends StatelessWidget {
  const CurrentTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final int taskCount = 5;

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
              child: TaskListView(taskCount: taskCount),
            ),
    );
  }
}
