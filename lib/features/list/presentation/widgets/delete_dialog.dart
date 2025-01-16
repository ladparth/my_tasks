import 'package:flutter/material.dart';
import 'package:my_tasks/features/list/presentation/provider/list_provider.dart';
import 'package:my_tasks/features/task/presentation/provider/task_provider.dart';
import 'package:provider/provider.dart';

class DeleteDialog extends StatelessWidget {
  final String listId;
  const DeleteDialog({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    final listProvider = context.read<ListProvider>();
    final taskProvider = context.read<TaskProvider>();
    return AlertDialog(
      title: const Text('Delete list'),
      content: const Text('Are you sure you want to delete this list?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            listProvider.removeList(listId);
            taskProvider.removeTasksByList(listId);
            Navigator.pop(context);
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
