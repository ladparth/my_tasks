import 'package:my_tasks/features/list/data/datasources/local/list_local_datasource.dart';
import 'package:my_tasks/features/list/data/repositories/list_repository_impl.dart';
import 'package:my_tasks/features/list/domain/usecases/add_list.dart';
import 'package:my_tasks/features/list/domain/usecases/get_lists.dart';
import 'package:my_tasks/features/list/domain/usecases/remove_list.dart';
import 'package:my_tasks/features/list/domain/usecases/update_list.dart';
import 'package:my_tasks/features/list/presentation/provider/list_provider.dart';

class ListDi {
  final ListLocalDatasource _listLocalDatasource = ListLocalDatasource();
  late final ListRepositoryImpl _listRepositoryImpl;
  late final AddList _addList;
  late final GetLists _getLists;
  late final RemoveList _removeList;
  late final UpdateList _updateList;
  late final ListProvider _listProvider;

  ListDi() {
    _listRepositoryImpl = ListRepositoryImpl(_listLocalDatasource);
    _addList = AddList(_listRepositoryImpl);
    _getLists = GetLists(_listRepositoryImpl);
    _removeList = RemoveList(_listRepositoryImpl);
    _updateList = UpdateList(_listRepositoryImpl);
    _listProvider = ListProvider(_addList, _getLists, _removeList, _updateList);
  }

  ListProvider get listProvider => _listProvider;
}
