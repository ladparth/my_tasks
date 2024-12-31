import 'package:flutter/material.dart';
import 'package:my_tasks/widgets/task_items/task_items.dart';

class CompletedTask extends StatelessWidget {
  CompletedTask({super.key});
  final RoundedRectangleBorder roundedRectBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide.none,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: roundedRectBorder,
      child: ExpansionTile(
        collapsedShape: roundedRectBorder,
        shape: roundedRectBorder,
        title: Text('Completed Tasks'),
        children: [
          TaskListView(taskCount: 3),
        ],
      ),
    );
  }
}
