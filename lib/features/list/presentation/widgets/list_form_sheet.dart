import 'package:flutter/material.dart';
import 'package:my_tasks/features/list/domain/entities/list_entity.dart';
import 'package:my_tasks/features/list/presentation/provider/list_provider.dart';
import 'package:provider/provider.dart';

class ListFormSheet extends StatefulWidget {
  final ListEntity? list;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController descriptionController;

  const ListFormSheet(
      {super.key,
      this.list,
      required this.formKey,
      required this.nameController,
      required this.descriptionController});

  @override
  State<ListFormSheet> createState() => _ListFormSheetState();
}

class _ListFormSheetState extends State<ListFormSheet> {
  @override
  void initState() {
    super.initState();
    if (widget.list != null) {
      widget.nameController.text = widget.list!.name;
    }
  }

  void _submitForm() {
    if (widget.formKey.currentState!.validate()) {
      final provider = Provider.of<ListProvider>(context, listen: false);

      final name = widget.nameController.text.trim();
      final description = widget.descriptionController.text.trim();
      final list = ListEntity(
          id: widget.list != null ? widget.list!.id : '',
          name: name,
          description: description);
      if (widget.list == null) {
        provider.addList(list);
        widget.nameController.clear();
      } else {
        provider.updateList(list);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.2,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: widget.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: true,
                  controller: widget.nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter list name',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autofocus: true,
                  controller: widget.descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Enter list description',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      _submitForm();
                      Navigator.pop(context);
                    },
                    child: Text(
                      widget.list == null ? 'Save' : 'Update',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
