import 'package:flutter/material.dart';

class TaskListDropdown extends StatelessWidget {
  const TaskListDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const TaskListSheet(),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'My Tasks',
            style: TextStyle(fontSize: 16),
          ),
          Icon(
            Icons.arrow_drop_down_rounded,
            size: 24,
          ),
        ],
      ),
    );
  }
}

class TaskListSheet extends StatelessWidget {
  const TaskListSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            leading: index == 0 ? Icon(Icons.check) : SizedBox(width: 24),
            title: Text('Task List $index'),
            onTap: () {
              // Handle task selection
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}
