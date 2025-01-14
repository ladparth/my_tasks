import 'package:flutter/material.dart';
import 'package:my_tasks/features/list/presentation/provider/list_provider.dart';
import 'package:provider/provider.dart';

class DeleteDialog extends StatelessWidget {
  final String listId;
  const DeleteDialog({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ListProvider>();
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
            provider.removeList(listId);
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
