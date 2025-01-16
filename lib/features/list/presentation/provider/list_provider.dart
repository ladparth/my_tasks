import 'package:flutter/material.dart';
import 'package:my_tasks/features/list/data/models/list_model.dart';
import 'package:my_tasks/features/list/domain/entities/list_entity.dart';
import 'package:my_tasks/features/list/domain/usecases/add_list.dart';
import 'package:my_tasks/features/list/domain/usecases/get_lists.dart';
import 'package:my_tasks/features/list/domain/usecases/remove_list.dart';
import 'package:my_tasks/features/list/domain/usecases/update_list.dart';
import 'package:uuid/uuid.dart';

class ListProvider extends ChangeNotifier {
  final AddList _addList;
  final GetLists _getLists;
  final RemoveList _removeList;
  final UpdateList _updateList;
  final Uuid _uuid = Uuid();

  ListProvider(
      this._addList, this._getLists, this._removeList, this._updateList) {
    _init();
  }

  List<ListEntity> _lists = [];

  List<ListEntity> get lists => _lists;

  Future<void> _init() async {
    await getLists();
  }

  Future<void> getLists() async {
    try {
      final lists = await _getLists();
      _lists = lists;
      notifyListeners();
    } catch (e) {
      print("Failed to get lists: $e");
    }
  }

  Future<void> addList(ListEntity list) async {
    try {
      final newList = ListModel(
          id: _uuid.v4(), name: list.name, description: list.description);
      _lists.add(newList);
      await _addList(newList);
      notifyListeners();
    } catch (e) {
      print("Failed to add list: $e");
    }
  }

  Future<void> removeList(String id) async {
    try {
      _lists.removeWhere((element) => element.id == id);
      await _removeList(id);
      notifyListeners();
    } catch (e) {
      print("Failed to remove list: $e");
    }
  }

  Future<void> updateList(ListEntity list) async {
    try {
      final index = _lists.indexWhere((element) => element.id == list.id);
      final ListModel updatedList = ListModel(
          id: list.id, name: list.name, description: list.description);
      _lists[index] = updatedList;
      await _updateList(updatedList);
      notifyListeners();
    } catch (e) {
      print("Failed to update list: $e");
    }
  }
}
