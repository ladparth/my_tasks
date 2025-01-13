import 'dart:convert';

import 'package:my_tasks/features/list/data/models/list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListLocalDatasource {
  Future<List<ListModel>> getLists() async {
    final prefs = await SharedPreferences.getInstance();
    final lists = prefs.getStringList('lists');

    if (lists == null) {
      return [];
    }

    return lists.map((list) => ListModel.fromJson(jsonDecode(list))).toList();
  }

  Future<void> saveLists(List<ListModel> lists) async {
    final prefs = await SharedPreferences.getInstance();
    final listsJson = lists.map((list) => jsonEncode(list.toJson())).toList();

    prefs.setStringList('lists', listsJson);
  }
}
