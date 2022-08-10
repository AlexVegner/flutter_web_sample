import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/cubits/project/project_detail_state.dart';
import 'package:web_app/models/project.dart';
import 'package:web_app/service/project/project_service.dart';

class ProjectDetailCubit extends Cubit<ProjectDetailState> {
  final ProjectService projectService;
  ProjectDetailCubit({required this.projectService})
      : super(ProjectDetailState());

  Future<void> leadData(String id) async {
    emit(state.copyWith(isLoading: true));
    try {
      final project = await projectService.byId(id);
      emit(state.copyWith(project: project));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> create(Project doc) async {
    emit(state.copyWith(isLoading: true));
    try {
      final project = await projectService.create(doc);
      emit(state.copyWith(project: project));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> update(Project doc) async {
    emit(state.copyWith(isLoading: true));
    try {
      final project = await projectService.update(doc);
      emit(state.copyWith(project: project));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
