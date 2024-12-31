import 'package:flutter/material.dart';
import 'package:my_tasks/widgets/completed_tasks.dart';
import 'package:my_tasks/widgets/current_tasks.dart';
import 'package:my_tasks/widgets/task_items/new_task.dart';
import 'package:my_tasks/widgets/task_list/list_dropdown.dart';
import 'package:my_tasks/widgets/task_list/new_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Tasks'),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TaskListDropdown(),
                  NewTaskListButton(),
                ],
              ),
              SizedBox(height: 5),
              CurrentTasks(),
              SizedBox(height: 5),
              CompletedTask()
            ],
          ),
        ),
      ),
      floatingActionButton: NewTaskButton(),
    );
  }
}
