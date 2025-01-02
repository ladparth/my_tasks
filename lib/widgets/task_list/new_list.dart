import 'package:flutter/material.dart';
import 'package:my_tasks/providers/task_provider.dart';
import 'package:provider/provider.dart';

class NewTaskListButton extends StatelessWidget {
  const NewTaskListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => NewListSheet(),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            size: 22,
          ),
          SizedBox(width: 5),
          Text(
            'New List',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class NewListSheet extends StatefulWidget {
  const NewListSheet({super.key});

  @override
  State<NewListSheet> createState() => _NewListSheetState();
}

class _NewListSheetState extends State<NewListSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Enter list name',
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    final name = _controller.text.trim();
                    if (name.isNotEmpty) {
                      Provider.of<TaskProvider>(context, listen: false)
                          .addTaskList(name);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
