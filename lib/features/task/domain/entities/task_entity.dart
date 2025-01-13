class TaskEntity {
  final String id;
  final String listId;
  final String title;
  final String description;
  final bool isCompleted;
  final bool isFavorite;

  TaskEntity({
    required this.id,
    required this.listId,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.isFavorite,
  });
}
