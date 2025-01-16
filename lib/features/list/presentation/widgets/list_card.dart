import 'package:flutter/material.dart';
import 'package:my_tasks/features/list/domain/entities/list_entity.dart';
import 'package:my_tasks/features/list/presentation/widgets/list_options.dart';
import 'package:my_tasks/features/task/presentation/pages/task_page.dart';
import 'package:my_tasks/features/task/presentation/widgets/progress_bar.dart';

class ListCard extends StatelessWidget {
  final ListEntity list;
  const ListCard({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskPage(list: list),
            ),
          );
        },
        title: Text(
          list.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (list.description.isNotEmpty)
              Text(
                list.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.outline,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            SizedBox(height: 8),
            ProgressBar(listId: list.id),
            SizedBox(height: 8),
          ],
        ),
        trailing: ListOptions(list: list),
      ),
    );
  }
}
