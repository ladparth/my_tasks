import 'package:flutter/material.dart';
import 'package:my_tasks/widgets/task_list/list_dropdown.dart';

class TaskDetailForm extends StatefulWidget {
  const TaskDetailForm({super.key});

  @override
  State<TaskDetailForm> createState() => _TaskDetailFormState();
}

class _TaskDetailFormState extends State<TaskDetailForm> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaskListDropdown(),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Enter title',
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Icon(Icons.subject, size: 28),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _detailsController,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Add details',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
