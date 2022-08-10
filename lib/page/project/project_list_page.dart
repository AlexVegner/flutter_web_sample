import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/common/routes/app_router.dart';
import 'package:web_app/cubits/project/project_list_cubit.dart';
import 'package:web_app/cubits/project/project_list_state.dart';
import 'package:web_app/models/project.dart';
import 'package:web_app/widget/common_scaffold.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectListCubit, ProjectListState>(
        builder: (context, state) {
      return CommonScaffold(
        // title: 'Project List',
        body: ListView.builder(
          itemCount: state.projectList?.length ?? 0,
          itemBuilder: (BuildContext context, int index) => _buildItem(
            context,
            index,
            state.projectList![index],
          ),
        ),
      );
    });
  }

  Widget _buildItem(BuildContext context, int index, Project project) {
    return Card(
      child: InkWell(
        onTap: () {
          AutoRouter.of(context).push(TaskListRoute(projectId: project.id));
        },
        child: ListTile(
          title: Text(project.title),
          subtitle: Text(project.description),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              AutoRouter.of(context)
                  .push(ProjectDetailRoute(projectId: project.id));
            },
          ),
        ),
      ),
    );
  }
}
