import 'package:my_tasks/features/list/domain/entities/list_entity.dart';

class ListModel extends ListEntity {
  ListModel({
    required super.id,
    required super.name,
    required super.description,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
