import 'package:my_tasks/features/task/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.listId,
    required super.title,
    required super.description,
    required super.isCompleted,
    required super.isFavorite,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      listId: json['listId'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
      isFavorite: json['isFavorite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'listId': listId,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'isFavorite': isFavorite,
    };
  }

  TaskModel copyWith({
    String? id,
    String? listId,
    String? title,
    String? description,
    bool? isCompleted,
    bool? isFavorite,
  }) {
    return TaskModel(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
