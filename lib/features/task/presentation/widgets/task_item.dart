import 'package:flutter/material.dart';
import 'package:my_tasks/features/task/domain/entities/task_entity.dart';
import 'package:my_tasks/features/task/presentation/provider/task_provider.dart';
import 'package:my_tasks/features/task/presentation/widgets/task_form.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  final TaskEntity task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<TaskProvider>();

    return ListTile(
      leading: Checkbox(
        value: task.isCompleted,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onChanged: (value) {
          provider.toggleTaskStatus(task.id);
        },
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          fontStyle: task.isCompleted ? FontStyle.italic : FontStyle.normal,
        ),
      ),
      trailing: IconButton(
        icon: task.isFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () {
          provider.toggleTaskFavorite(task.id);
        },
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return TaskForm(
              task: task,
              listId: task.listId,
            );
          },
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
