class Task {
  final String id;
  final String projectId;
  final String title;
  final String description;
  final TaskStatus status;

  Task({
    required this.id,
    required this.projectId,
    required this.title,
    required this.description,
    required this.status,
  });
}

enum TaskStatus { todo, inProgress, done }
