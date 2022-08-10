import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/cubits/task/task_list_state.dart';
import 'package:web_app/service/task/task_service.dart';

class TaskListCubit extends Cubit<TaskListState> {
  final TaskService taskService;
  TaskListCubit({required this.taskService}) : super(TaskListState());

  Future<void> leadData(String projectId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final list = await taskService.list();
      emit(state.copyWith(taskList: list));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> delete(String id) async {
    emit(state.copyWith(isLoading: true));
    try {
      await taskService.delete(id);
      final list = await taskService.list();
      emit(state.copyWith(taskList: list));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
