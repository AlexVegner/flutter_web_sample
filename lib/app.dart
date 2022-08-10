import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/common/di.dart';
import 'package:web_app/common/routes/app_router.dart';
import 'package:web_app/common/theme/app_theme.dart';
import 'package:web_app/cubits/auth/auth_cubit.dart';
import 'package:web_app/cubits/me/me_cubit.dart';
import 'package:web_app/cubits/project/project_list_cubit.dart';
import 'package:web_app/cubits/task/task_list_cubit.dart';
import 'package:web_app/cubits/theme/theme_cubit.dart';
import 'package:web_app/cubits/theme/theme_state.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appRouter = AppRouter(globalNavigatorKey);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (c) => getIt()),
        BlocProvider<AuthCubit>(create: (c) => getIt()),
        BlocProvider<MeCubit>(create: (c) => getIt()),
        BlocProvider<ProjectListCubit>(
            create: (c) => getIt<ProjectListCubit>()..leadData()),
        BlocProvider<TaskListCubit>(create: (c) => getIt()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return MaterialApp.router(
          title: 'Web app',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
          routerDelegate: appRouter.delegate(
            navigatorObservers: () => [observer],
          ),
          routeInformationParser: appRouter.defaultRouteParser(),
          scrollBehavior: AppScrollBehavior(),
        );
      }),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
