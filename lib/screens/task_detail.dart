import 'package:flutter/material.dart';
import 'package:my_tasks/models/task.dart';
import 'package:my_tasks/providers/task_provider.dart';
import 'package:my_tasks/widgets/task_items/task_detail_form.dart';
import 'package:provider/provider.dart';

class TaskDetail extends StatefulWidget {
  final String taskListId;
  final Task task;

  const TaskDetail({super.key, required this.taskListId, required this.task});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _detailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.task.title;
    _detailsController.text = widget.task.description ?? '';
  }

  void _submitForm(TaskProvider taskProvider) {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text;
      final detail = _detailsController.text;

      final updatedTask = Task(
        id: widget.task.id,
        title: title,
        description: detail,
        dueDate: widget.task.dueDate,
        isCompleted: widget.task.isCompleted,
        isFavorite: widget.task.isFavorite,
        subtasks: widget.task.subtasks,
      );

      taskProvider.updateTask(widget.taskListId, updatedTask);

      final currentTaskListId = taskProvider.selectedTaskList?.id;

      if (currentTaskListId != widget.taskListId) {
        taskProvider.moveTask(
            widget.taskListId, currentTaskListId!, widget.task.id);
      }

      Navigator.pop(context); // Navigate back
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _submitForm(taskProvider);
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: widget.task.isFavorite
                    ? Icon(Icons.star)
                    : Icon(Icons.star_border_outlined),
                onPressed: () {
                  taskProvider.toggleIsFavorite(
                      widget.taskListId, widget.task.id);
                }),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                taskProvider.deleteTask(widget.taskListId, widget.task.id);
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: TaskDetailForm(
          formKey: _formKey,
          titleController: _titleController,
          detailsController: _detailsController,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                taskProvider.toggleIsCompleted(
                    widget.taskListId, widget.task.id);
                Navigator.pop(context);
              },
              child: Text(
                widget.task.isCompleted ? 'Mark uncompleted' : 'Mark completed',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
