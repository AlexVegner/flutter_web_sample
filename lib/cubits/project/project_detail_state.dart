import 'package:web_app/models/project.dart';

class ProjectDetailState {
  final bool isLoading;
  final Project? project;

  ProjectDetailState({
    this.isLoading = false,
    this.project,
  });

  ProjectDetailState copyWith({
    bool? isLoading,
    Project? project,
  }) {
    return ProjectDetailState(
      isLoading: isLoading ?? this.isLoading,
      project: project ?? this.project,
    );
  }
}
