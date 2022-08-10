import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/cubits/project/project_list_state.dart';
import 'package:web_app/service/project/project_service.dart';

class ProjectListCubit extends Cubit<ProjectListState> {
  final ProjectService projectService;
  ProjectListCubit({required this.projectService}) : super(ProjectListState());

  Future<void> leadData() async {
    emit(state.copyWith(isLoading: true));
    try {
      final list = await projectService.list();
      emit(state.copyWith(projectList: list));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> delete(String id) async {
    emit(state.copyWith(isLoading: true));
    try {
      await projectService.delete(id);
      final list = await projectService.list();
      emit(state.copyWith(projectList: list));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
