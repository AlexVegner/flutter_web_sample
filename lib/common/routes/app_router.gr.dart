// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    SignupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignupPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    ProjectDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProjectDetailRouteArgs>(
          orElse: () => ProjectDetailRouteArgs(
              projectId: pathParams.getString('projectId')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ProjectDetailPage(key: args.key, projectId: args.projectId));
    },
    TaskListRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TaskListRouteArgs>(
          orElse: () =>
              TaskListRouteArgs(projectId: pathParams.getString('projectId')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: TaskListPage(key: args.key, projectId: args.projectId));
    },
    TaskDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TaskDetailRouteArgs>(
          orElse: () => TaskDetailRouteArgs(
              projectId: pathParams.getString('projectId'),
              taskId: pathParams.getString('taskId')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: TaskDetailPage(
              key: args.key, projectId: args.projectId, taskId: args.taskId));
    },
    UnknownRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UnknownPage());
    },
    MeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MePage());
    },
    ProjectListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProjectListPage());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        RouteConfig(SplashRoute.name, path: '/splash'),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(SignupRoute.name, path: '/signup'),
        RouteConfig(HomeRoute.name,
            path: '/home',
            usesPathAsKey: true,
            children: [
              RouteConfig('#redirect',
                  path: '',
                  parent: HomeRoute.name,
                  redirectTo: 'projects',
                  fullMatch: true),
              RouteConfig(MeRoute.name,
                  path: 'me', parent: HomeRoute.name, usesPathAsKey: true),
              RouteConfig(ProjectListRoute.name,
                  path: 'projects',
                  parent: HomeRoute.name,
                  usesPathAsKey: true),
              RouteConfig(SettingsRoute.name,
                  path: 'settings', parent: HomeRoute.name, usesPathAsKey: true)
            ]),
        RouteConfig(ProjectDetailRoute.name, path: '/projects/:projectId'),
        RouteConfig(TaskListRoute.name, path: '/projects/:projectId/tasks'),
        RouteConfig(TaskDetailRoute.name,
            path: '/projects/:projectId/tasks/:taskId'),
        RouteConfig(UnknownRoute.name, path: '*')
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [SignupPage]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute() : super(SignupRoute.name, path: '/signup');

  static const String name = 'SignupRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ProjectDetailPage]
class ProjectDetailRoute extends PageRouteInfo<ProjectDetailRouteArgs> {
  ProjectDetailRoute({Key? key, required String projectId})
      : super(ProjectDetailRoute.name,
            path: '/projects/:projectId',
            args: ProjectDetailRouteArgs(key: key, projectId: projectId),
            rawPathParams: {'projectId': projectId});

  static const String name = 'ProjectDetailRoute';
}

class ProjectDetailRouteArgs {
  const ProjectDetailRouteArgs({this.key, required this.projectId});

  final Key? key;

  final String projectId;

  @override
  String toString() {
    return 'ProjectDetailRouteArgs{key: $key, projectId: $projectId}';
  }
}

/// generated route for
/// [TaskListPage]
class TaskListRoute extends PageRouteInfo<TaskListRouteArgs> {
  TaskListRoute({Key? key, required String projectId})
      : super(TaskListRoute.name,
            path: '/projects/:projectId/tasks',
            args: TaskListRouteArgs(key: key, projectId: projectId),
            rawPathParams: {'projectId': projectId});

  static const String name = 'TaskListRoute';
}

class TaskListRouteArgs {
  const TaskListRouteArgs({this.key, required this.projectId});

  final Key? key;

  final String projectId;

  @override
  String toString() {
    return 'TaskListRouteArgs{key: $key, projectId: $projectId}';
  }
}

/// generated route for
/// [TaskDetailPage]
class TaskDetailRoute extends PageRouteInfo<TaskDetailRouteArgs> {
  TaskDetailRoute({Key? key, required String projectId, required String taskId})
      : super(TaskDetailRoute.name,
            path: '/projects/:projectId/tasks/:taskId',
            args: TaskDetailRouteArgs(
                key: key, projectId: projectId, taskId: taskId),
            rawPathParams: {'projectId': projectId, 'taskId': taskId});

  static const String name = 'TaskDetailRoute';
}

class TaskDetailRouteArgs {
  const TaskDetailRouteArgs(
      {this.key, required this.projectId, required this.taskId});

  final Key? key;

  final String projectId;

  final String taskId;

  @override
  String toString() {
    return 'TaskDetailRouteArgs{key: $key, projectId: $projectId, taskId: $taskId}';
  }
}

/// generated route for
/// [UnknownPage]
class UnknownRoute extends PageRouteInfo<void> {
  const UnknownRoute() : super(UnknownRoute.name, path: '*');

  static const String name = 'UnknownRoute';
}

/// generated route for
/// [MePage]
class MeRoute extends PageRouteInfo<void> {
  const MeRoute() : super(MeRoute.name, path: 'me');

  static const String name = 'MeRoute';
}

/// generated route for
/// [ProjectListPage]
class ProjectListRoute extends PageRouteInfo<void> {
  const ProjectListRoute() : super(ProjectListRoute.name, path: 'projects');

  static const String name = 'ProjectListRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}
