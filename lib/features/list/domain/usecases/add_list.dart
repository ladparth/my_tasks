import 'package:my_tasks/features/list/domain/entities/list_entity.dart';
import 'package:my_tasks/features/list/domain/repositories/list_repository.dart';

class AddList {
  final ListRepository repository;

  AddList(this.repository);

  Future<void> call(ListEntity list) async {
    return await repository.addList(list);
  }
}
