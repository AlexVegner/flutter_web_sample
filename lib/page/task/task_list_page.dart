import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/common/di.dart';
import 'package:web_app/common/routes/app_router.dart';
import 'package:web_app/cubits/task/task_list_cubit.dart';
import 'package:web_app/cubits/task/task_list_state.dart';
import 'package:web_app/models/task.dart';
import 'package:web_app/widget/common_scaffold.dart';

class TaskListPage extends StatefulWidget implements AutoRouteWrapper {
  final String projectId;
  const TaskListPage({
    Key? key,
    @pathParam required this.projectId,
  }) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => getIt<TaskListCubit>()..leadData(projectId),
        child: this);
  }
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListCubit, TaskListState>(builder: (context, state) {
      return CommonScaffold(
        title: 'Task List \n projectId: ${widget.projectId}',
        body: ListView.builder(
          itemCount: state.taskList?.length ?? 0,
          itemBuilder: (BuildContext context, int index) => _buildItem(
            context,
            index,
            state.taskList![index],
          ),
        ),
      );
    });
  }

  Widget _buildItem(BuildContext context, int index, Task task) {
    return Card(
      child: InkWell(
        onTap: () {
          AutoRouter.of(context).push(
              TaskDetailRoute(projectId: widget.projectId, taskId: task.id));
        },
        child: ListTile(
          title: Text(task.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.description),
              Text(task.status.name),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
    );
  }
}
