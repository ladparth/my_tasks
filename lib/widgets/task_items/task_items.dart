import 'package:flutter/material.dart';
import 'package:my_tasks/screens/task_detail.dart';

class TaskListView extends StatelessWidget {
  final int taskCount;
  const TaskListView({super.key, required this.taskCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.4,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 5),
        itemCount: taskCount,
        itemBuilder: (context, index) {
          return TaskItem();
        },
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onChanged: (value) {},
      ),
      title: Text('Task 1'),
      trailing: IconButton(
        icon: Icon(Icons.star_border),
        onPressed: () {},
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskDetail()),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
