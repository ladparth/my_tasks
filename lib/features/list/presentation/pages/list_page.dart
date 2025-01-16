import 'package:flutter/material.dart';
import 'package:my_tasks/features/list/presentation/provider/list_provider.dart';
import 'package:my_tasks/features/list/presentation/widgets/list_card.dart';
import 'package:my_tasks/features/list/presentation/widgets/new_list_button.dart';
import 'package:my_tasks/features/list/presentation/widgets/list_form.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ListProvider>();
    final lists = provider.lists;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('My Tasks'),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ListCard(list: lists[index]),
          );
        },
      ),
      floatingActionButton: NewListButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ListForm();
            },
          );
        },
      ),
    );
  }
}
