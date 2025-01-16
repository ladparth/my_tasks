import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  const FloatingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(
        'New List',
        style: TextStyle(fontSize: 16),
      ),
      icon: Icon(Icons.add),
    );
  }
}
