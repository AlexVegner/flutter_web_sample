import 'package:web_app/models/project.dart';

class ProjectListState {
  final bool isLoading;
  final List<Project>? projectList;

  ProjectListState({
    this.isLoading = false,
    this.projectList,
  });

  ProjectListState copyWith({
    bool? isLoading,
    List<Project>? projectList,
  }) {
    return ProjectListState(
      isLoading: isLoading ?? this.isLoading,
      projectList: projectList ?? this.projectList,
    );
  }
}
