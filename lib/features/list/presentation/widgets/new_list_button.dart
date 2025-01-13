import 'package:flutter/material.dart';
import 'package:my_tasks/features/list/presentation/widgets/list_form_sheet.dart';

class NewListButton extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  NewListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => ListFormSheet(
            formKey: formKey,
            nameController: nameController,
            descriptionController: descriptionController,
          ),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            size: 22,
          ),
          SizedBox(width: 5),
          Text(
            'New List',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
