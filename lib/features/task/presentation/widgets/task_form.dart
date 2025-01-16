import 'package:flutter/material.dart';
import 'package:my_tasks/core/widgets/bottom_sheet_container.dart';
import 'package:my_tasks/features/task/domain/entities/task_entity.dart';
import 'package:my_tasks/features/task/presentation/provider/task_provider.dart';
import 'package:provider/provider.dart';

class TaskForm extends StatefulWidget {
  final TaskEntity? task;
  final String listId;
  const TaskForm({super.key, this.task, required this.listId});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<TaskProvider>(context, listen: false);

      final title = _titleController.text.trim();
      final description = _descriptionController.text.trim();
      final task = TaskEntity(
          id: widget.task?.id ?? '',
          listId: widget.listId,
          title: title,
          description: description,
          isCompleted: widget.task?.isCompleted ?? false,
          isFavorite: widget.task?.isFavorite ?? false);

      if (widget.task == null) {
        provider.addTask(task);
        _titleController.clear();
        _descriptionController.clear();
      } else {
        provider.updateTask(task);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              autofocus: true,
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              autofocus: true,
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _titleController,
                  builder: (context, value, child) {
                    final isEnabled = value.text.trim().isEmpty;
                    return TextButton(
                      onPressed: isEnabled
                          ? null
                          : () {
                              _submitForm();
                              Navigator.pop(context);
                            },
                      child: Text(
                        widget.task == null ? 'Save' : 'Update',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
