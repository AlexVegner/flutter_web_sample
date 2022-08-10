import 'package:web_app/models/task.dart';

class TaskDetailState {
  final bool isLoading;
  final Task? task;

  TaskDetailState({
    this.isLoading = false,
    this.task,
  });

  TaskDetailState copyWith({
    bool? isLoading,
    Task? task,
  }) {
    return TaskDetailState(
      isLoading: isLoading ?? this.isLoading,
      task: task ?? this.task,
    );
  }
}
