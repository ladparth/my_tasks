import 'package:my_tasks/features/list/domain/entities/list_entity.dart';
import 'package:my_tasks/features/list/domain/repositories/list_repository.dart';

class UpdateList {
  final ListRepository repository;

  UpdateList(this.repository);

  Future<void> call(ListEntity list) async {
    return await repository.updateList(list);
  }
}
