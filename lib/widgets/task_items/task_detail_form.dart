import 'package:flutter/material.dart';
import 'package:my_tasks/widgets/task_list/list_dropdown.dart';

class TaskDetailForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController detailsController;

  const TaskDetailForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.detailsController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskListDropdown(),
            TextFormField(
              controller: titleController,
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
                  child: TextFormField(
                    controller: detailsController,
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
      ),
    );
  }
}
