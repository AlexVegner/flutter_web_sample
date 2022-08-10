import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/common/di.dart';
import 'package:web_app/common/routes/app_router.dart';
import 'package:web_app/cubits/task/task_detail_cubit.dart';
import 'package:web_app/cubits/task/task_detail_state.dart';
import 'package:web_app/models/task.dart';
import 'package:web_app/widget/common_scaffold.dart';

class TaskDetailPage extends StatefulWidget implements AutoRouteWrapper {
  final String projectId;
  final String taskId;
  const TaskDetailPage({
    Key? key,
    @pathParam required this.projectId,
    @pathParam required this.taskId,
  }) : super(key: key);

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => getIt<TaskDetailCubit>()..leadData(projectId, taskId),
        child: this);
  }
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailCubit, TaskDetailState>(
        builder: (context, state) {
      return CommonScaffold(
        title: 'Task Detail',
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: _buildProject(state.task),
          ),
        ),
      );
    });
  }

  Widget _buildProject(Task? task) {
    if (task == null) {
      return const SizedBox.shrink();
    }
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          _buildField('id:', task.id),
          _buildField('Title: ', task.title),
          _buildField('Description:', task.description),
          _buildField('Status:', task.status.name),
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
