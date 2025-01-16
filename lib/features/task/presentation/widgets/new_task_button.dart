import 'package:flutter/material.dart';

class NewTaskButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NewTaskButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(
        'New Task',
        style: TextStyle(fontSize: 16),
      ),
      icon: Icon(Icons.add),
    );
  }
}
