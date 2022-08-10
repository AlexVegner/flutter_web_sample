import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/common/di.dart';
import 'package:web_app/common/routes/app_router.dart';
import 'package:web_app/cubits/project/project_detail_cbit.dart';
import 'package:web_app/cubits/project/project_detail_state.dart';
import 'package:web_app/models/project.dart';
import 'package:web_app/widget/common_scaffold.dart';

class ProjectDetailPage extends StatefulWidget implements AutoRouteWrapper {
  final String projectId;
  const ProjectDetailPage({
    Key? key,
    @pathParam required this.projectId,
  }) : super(key: key);

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => getIt<ProjectDetailCubit>()..leadData(projectId),
        child: this);
  }
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectDetailCubit, ProjectDetailState>(
        builder: (context, state) {
      return CommonScaffold(
        title: 'Project Detail',
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: _buildProject(state.project),
          ),
        ),
      );
    });
  }

  Widget _buildProject(Project? project) {
    if (project == null) {
      return const SizedBox.shrink();
    }
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          _buildField('id:', project.id),
          _buildField('Title: ', project.title),
          _buildField('Description:', project.description),
        ],
      ),
    );
  }

  Widget _buildField(String title, String value) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(title)),
        const SizedBox(width: 12),
        Text(value),
      ],
    );
  }
}
