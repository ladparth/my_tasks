import 'package:flutter/material.dart';
import 'package:my_tasks/features/list/domain/entities/list_entity.dart';
import 'package:my_tasks/features/list/presentation/widgets/list_options.dart';
import 'package:my_tasks/features/task/presentation/widgets/progress_bar.dart';

class ListCard extends StatelessWidget {
  final ListEntity list;
  const ListCard({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    list.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListOptions(
                    list: list,
                  ),
                ],
              ),
              if (list.description != '')
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
        ),
      ),
    );
  }
}
