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

  // Convert a Task object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate?.toIso8601String(),
      'isCompleted': isCompleted,
      'isFavorite': isFavorite,
      'subtasks': subtasks.map((subtask) => subtask.toJson()).toList(),
    };
  }

  // Create a Task object from JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      isCompleted: json['isCompleted'],
      isFavorite: json['isFavorite'],
      subtasks: (json['subtasks'] as List)
          .map((sub) => SubTask.fromJson(sub))
          .toList(),
    );
  }
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

  // Convert a SubTask object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  // Create a SubTask object from JSON
  factory SubTask.fromJson(Map<String, dynamic> json) {
    return SubTask(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }
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

  // Convert a TaskList object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tasks': tasks.map((task) => task.toJson()).toList(),
    };
  }

  // Create a TaskList object from JSON
  factory TaskList.fromJson(Map<String, dynamic> json) {
    return TaskList(
      id: json['id'],
      name: json['name'],
      tasks:
          (json['tasks'] as List).map((task) => Task.fromJson(task)).toList(),
    );
  }
}
