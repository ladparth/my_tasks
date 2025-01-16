import 'package:my_tasks/features/list/domain/repositories/list_repository.dart';

class RemoveList {
  final ListRepository repository;

  RemoveList(this.repository);

  Future<void> call(String id) async {
    return repository.removeList(id);
  }
}
