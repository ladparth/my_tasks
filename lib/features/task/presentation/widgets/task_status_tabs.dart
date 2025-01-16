import 'package:flutter/material.dart';
import 'package:my_tasks/features/task/presentation/provider/task_provider.dart';
import 'package:my_tasks/features/task/presentation/widgets/task_list_view.dart';
import 'package:provider/provider.dart';

class TaskStatusTabs extends StatelessWidget {
  final String listId;
  const TaskStatusTabs({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProvider>();
    final pendingTasks = provider.getPendingTasks(listId);
    final completedTasks = provider.getCompletedTasks(listId);

    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: 2,
      child: Column(
        children: [
          TabBar(
            splashBorderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.pending_outlined),
                    SizedBox(width: 10),
                    Text('Pending'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done),
                    SizedBox(width: 10),
                    Text('Completed'),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TabBarView(
                children: [
                  TaskListView(tasks: pendingTasks),
                  TaskListView(tasks: completedTasks),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
