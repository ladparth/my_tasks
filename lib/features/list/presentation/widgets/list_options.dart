import 'package:flutter/material.dart';
import 'package:my_tasks/core/widgets/bottom_sheet_container.dart';
import 'package:my_tasks/features/list/domain/entities/list_entity.dart';
import 'package:my_tasks/features/list/presentation/widgets/delete_dialog.dart';
import 'package:my_tasks/features/list/presentation/widgets/list_form.dart';

class ListOptions extends StatelessWidget {
  final ListEntity list;
  const ListOptions({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final RoundedRectangleBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return BottomSheetContainer(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('Edit'),
                        onTap: () {
                          Navigator.pop(context);
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ListForm(
                                list: list,
                              );
                            },
                          );
                        },
                        shape: shape,
                      ),
                      ListTile(
                        leading: Icon(Icons.delete),
                        title: Text('Delete'),
                        onTap: () {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return DeleteDialog(listId: list.id);
                              });
                        },
                        shape: shape,
                      ),
                    ],
                  ),
                );
              });
        },
        icon: Icon(Icons.more_vert));
  }
}
