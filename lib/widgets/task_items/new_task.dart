import 'package:flutter/material.dart';
import 'package:my_tasks/widgets/task_list/list_dropdown.dart';

class NewTaskButton extends StatelessWidget {
  const NewTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'New Task',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const NewTaskSheet(),
        );
      },
      elevation: 2,
      child: Icon(Icons.add),
    );
  }
}

class NewTaskSheet extends StatelessWidget {
  const NewTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TaskListDropdown(),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter task title',
              border: InputBorder.none,
            ),
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
