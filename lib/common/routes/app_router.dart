import 'package:flutter/widgets.dart';
import 'package:web_app/page/home/home_page.dart';
import 'package:web_app/page/login/login_page.dart';
import 'package:web_app/page/me/me_page.dart';
import 'package:web_app/page/project/project_details.dart';
import 'package:web_app/page/project/project_list_page.dart';
import 'package:web_app/page/settings/settings_page.dart';
import 'package:web_app/page/signup/signup_page.dart';
import 'package:web_app/page/splash/splash_page.dart';
import 'package:web_app/page/task/task_details.dart';
import 'package:web_app/page/task/task_list_page.dart';
import 'package:web_app/page/unknown/unknown_page.dart';

import 'app_router.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute<dynamic>>[
    AutoRoute(path: '/splash', page: SplashPage, initial: true),
    AutoRoute(path: '/login', page: LoginPage),
    AutoRoute(path: '/signup', page: SignupPage),
    AutoRoute(
      path: '/home',
      page: HomePage,
      usesPathAsKey: true,
      children: [
        RedirectRoute(path: '', redirectTo: 'projects'),
        AutoRoute(path: 'me', page: MePage, usesPathAsKey: true),
        AutoRoute(path: 'projects', page: ProjectListPage, usesPathAsKey: true),
        AutoRoute(path: 'settings', page: SettingsPage, usesPathAsKey: true),
      ],
    ),
    AutoRoute(path: '/projects/:projectId', page: ProjectDetailPage),
    // AutoRoute(path: '/projects', page: ProjectListPage),
    AutoRoute(path: '/projects/:projectId/tasks', page: TaskListPage),
    AutoRoute(path: '/projects/:projectId/tasks/:taskId', page: TaskDetailPage),

    // 404
    AutoRoute(path: '*', page: UnknownPage),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);
}

Widget noTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return child;
}

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();
