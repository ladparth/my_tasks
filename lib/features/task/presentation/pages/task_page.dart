import 'package:flutter/material.dart';
import 'package:my_tasks/features/list/domain/entities/list_entity.dart';
import 'package:my_tasks/features/list/presentation/widgets/list_options.dart';
import 'package:my_tasks/features/task/presentation/widgets/new_task_button.dart';
import 'package:my_tasks/features/task/presentation/widgets/task_form.dart';
import 'package:my_tasks/features/task/presentation/widgets/task_header_view.dart';
import 'package:my_tasks/features/task/presentation/widgets/task_status_tabs.dart';

class TaskPage extends StatelessWidget {
  final ListEntity list;
  const TaskPage({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          ListOptions(
            list: list,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaskHeaderView(list: list),
          SizedBox(height: 20),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: TaskStatusTabs(
                  listId: list.id,
                )),
          ),
        ],
      ),
      floatingActionButton: NewTaskButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return TaskForm(
                listId: list.id,
              );
            },
          );
        },
      ),
    );
  }
}
