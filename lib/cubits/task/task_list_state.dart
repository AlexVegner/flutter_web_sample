import 'package:web_app/models/task.dart';

class TaskListState {
  final bool isLoading;
  final List<Task>? taskList;

  TaskListState({
    this.isLoading = false,
    this.taskList,
  });

  TaskListState copyWith({
    bool? isLoading,
    List<Task>? taskList,
  }) {
    return TaskListState(
      isLoading: isLoading ?? this.isLoading,
      taskList: taskList ?? this.taskList,
    );
  }
}
