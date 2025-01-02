import 'package:flutter/material.dart';
import 'package:my_tasks/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskListDropdown extends StatelessWidget {
  const TaskListDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final selectedTaskList = taskProvider.selectedTaskList;

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
            selectedTaskList?.name ?? 'My Tasks',
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
    final taskProvider = Provider.of<TaskProvider>(context);
    final taskLists = taskProvider.taskLists;
    final selectedTaskList = taskProvider.selectedTaskList;
    final selectedTaskListId = selectedTaskList?.id;
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: taskLists.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: selectedTaskListId == taskLists[index].id
                ? Icon(Icons.check)
                : SizedBox(width: 24),
            title: Text(taskLists[index].name),
            onTap: () {
              taskProvider.setSelectedTaskList(taskLists[index].id);
              Navigator.pop(context);
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
