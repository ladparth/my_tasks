import 'package:flutter/material.dart';
import 'package:my_tasks/features/list/presentation/provider/list_provider.dart';
import 'package:my_tasks/features/list/presentation/widgets/list_form_sheet.dart';
import 'package:provider/provider.dart';

class Lists extends StatelessWidget {
  Lists({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ListProvider>();

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: provider.lists.length,
        itemBuilder: (context, index) {
          final list = provider.lists[index];
          return ListTile(
            title: Text(list.name),
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => ListFormSheet(
                  list: list,
                  formKey: formKey,
                  nameController: nameController,
                  descriptionController: descriptionController,
                ),
              );
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => provider.removeList(list.id),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
