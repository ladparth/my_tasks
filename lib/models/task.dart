class Task {
  String id;
  String title;
  String? description;
  DateTime? dueDate;
  bool isCompleted;
  bool isFavorite;
  List<SubTask> subtasks;

  Task({
    required this.id,
    required this.title,
    this.description,
    this.dueDate,
    this.isCompleted = false,
    this.isFavorite = false,
    List<SubTask>? subtasks,
  }) : subtasks = subtasks ?? [];
}

class SubTask {
  String id;
  String title;
  bool isCompleted;

  SubTask({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}

class TaskList {
  String id;
  String name;
  List<Task> tasks;

  TaskList({
    required this.id,
    required this.name,
    List<Task>? tasks,
  }) : tasks = tasks ?? [];
}
