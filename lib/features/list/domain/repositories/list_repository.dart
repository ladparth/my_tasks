import 'package:my_tasks/features/list/domain/entities/list_entity.dart';

abstract class ListRepository {
  Future<List<ListEntity>> getLists();
  Future<void> addList(ListEntity list);
  Future<void> removeList(String id);
  Future<void> updateList(ListEntity list);
}
