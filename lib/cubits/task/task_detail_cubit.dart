import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/cubits/task/task_detail_state.dart';
import 'package:web_app/models/task.dart';
import 'package:web_app/service/task/task_service.dart';

class TaskDetailCubit extends Cubit<TaskDetailState> {
  final TaskService taskService;
  TaskDetailCubit({required this.taskService}) : super(TaskDetailState());

  Future<void> leadData(String projectId, String taskId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final task = await taskService.byId(taskId);
      emit(state.copyWith(task: task));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> create(Task doc) async {
    emit(state.copyWith(isLoading: true));
    try {
      final task = await taskService.create(doc);
      emit(state.copyWith(task: task));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> update(Task doc) async {
    emit(state.copyWith(isLoading: true));
    try {
      final task = await taskService.update(doc);
      emit(state.copyWith(task: task));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
