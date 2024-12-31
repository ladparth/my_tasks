import 'package:flutter/material.dart';
import 'package:my_tasks/widgets/task_items/task_detail_form.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: true == true
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border_outlined),
              onPressed: () {}),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          )
        ],
      ),
      body: TaskDetailForm(),
      bottomNavigationBar: BottomAppBar(
        child: Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              true == true ? 'Mark uncompleted' : 'Mark completed',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
