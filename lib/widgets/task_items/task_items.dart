import 'package:flutter/material.dart';
import 'package:my_tasks/models/task.dart';
import 'package:my_tasks/providers/task_provider.dart';
import 'package:my_tasks/screens/task_detail.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatelessWidget {
  final List<Task> tasks;
  const TaskListView({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.4,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 5),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskItem(
            task: tasks[index],
          );
        },
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final taskList = taskProvider.selectedTaskList;
    final taskListId = taskList?.id;

    return ListTile(
      leading: Checkbox(
        value: task.isCompleted,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onChanged: (value) {
          taskProvider.toggleIsCompleted(taskListId!, task.id);
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
          taskProvider.toggleIsFavorite(taskListId!, task.id);
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TaskDetail(
                    taskListId: taskListId!,
                    task: task,
                  )),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
