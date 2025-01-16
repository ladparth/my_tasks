import 'package:my_tasks/features/list/data/datasources/local/list_local_datasource.dart';
import 'package:my_tasks/features/list/data/models/list_model.dart';
import 'package:my_tasks/features/list/domain/entities/list_entity.dart';
import 'package:my_tasks/features/list/domain/repositories/list_repository.dart';

class ListRepositoryImpl extends ListRepository {
  final ListLocalDatasource localDatasource;

  ListRepositoryImpl(this.localDatasource);

  @override
  Future<void> addList(ListEntity list) async {
    final lists = await localDatasource.getLists();
    final listModel =
        ListModel(id: list.id, name: list.name, description: list.description);
    lists.add(listModel);
    await localDatasource.saveLists(lists);
  }

  @override
  Future<List<ListEntity>> getLists() async {
    final lists = await localDatasource.getLists();
    return lists;
  }

  @override
  Future<void> removeList(String id) async {
    final lists = await localDatasource.getLists();
    lists.removeWhere((element) => element.id == id);
    await localDatasource.saveLists(lists);
  }

  @override
  Future<void> updateList(ListEntity list) async {
    final lists = await localDatasource.getLists();
    final listIndex = lists.indexWhere((element) => element.id == list.id);
    lists[listIndex] =
        ListModel(id: list.id, name: list.name, description: list.description);
    await localDatasource.saveLists(lists);
  }
}
