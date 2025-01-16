import 'package:flutter/material.dart';
import 'package:my_tasks/core/widgets/bottom_sheet_container.dart';
import 'package:my_tasks/features/list/domain/entities/list_entity.dart';
import 'package:my_tasks/features/list/presentation/provider/list_provider.dart';
import 'package:provider/provider.dart';

class ListForm extends StatefulWidget {
  final ListEntity? list;
  const ListForm({super.key, this.list});

  @override
  State<ListForm> createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<ListProvider>(context, listen: false);

      final name = _nameController.text.trim();
      final description = _descriptionController.text.trim();
      final list = ListEntity(
          id: widget.list?.id ?? '', name: name, description: description);

      if (widget.list == null) {
        provider.addList(list);
        _nameController.clear();
        _descriptionController.clear();
      } else {
        provider.updateList(list);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.list != null) {
      _nameController.text = widget.list!.name;
      _descriptionController.text = widget.list!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              autofocus: true,
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'List name',
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              autofocus: true,
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _nameController,
                  builder: (context, value, child) {
                    final isEnabled = value.text.trim().isEmpty;
                    return TextButton(
                      onPressed: isEnabled
                          ? null
                          : () {
                              _submitForm();
                              Navigator.pop(context);
                            },
                      child: Text(
                        widget.list == null ? 'Save' : 'Update',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
