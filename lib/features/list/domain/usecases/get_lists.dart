import 'package:my_tasks/features/list/domain/entities/list_entity.dart';
import 'package:my_tasks/features/list/domain/repositories/list_repository.dart';

class GetLists {
  final ListRepository repository;

  GetLists(this.repository);

  Future<List<ListEntity>> call() async {
    return await repository.getLists();
  }
}
