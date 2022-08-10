import 'package:get_it/get_it.dart';
import 'package:web_app/cubits/auth/auth_cubit.dart';
import 'package:web_app/cubits/me/me_cubit.dart';
import 'package:web_app/cubits/project/project_detail_cbit.dart';
import 'package:web_app/cubits/project/project_list_cubit.dart';
import 'package:web_app/cubits/task/task_detail_cubit.dart';
import 'package:web_app/cubits/task/task_list_cubit.dart';
import 'package:web_app/cubits/theme/theme_cubit.dart';
import 'package:web_app/service/auth/auth_service.dart';
import 'package:web_app/service/auth/auth_service_mock.dart';
import 'package:web_app/service/me/me_service.dart';
import 'package:web_app/service/me/me_service_mock.dart';
import 'package:web_app/service/project/project_service.dart';
import 'package:web_app/service/project/project_service_mock.dart';
import 'package:web_app/service/task/task_service.dart';
import 'package:web_app/service/task/task_service_mock.dart';

final getIt = GetIt.instance;

Future<void> setupInjections() async {
  // Theme.
  getIt.registerFactory<ThemeCubit>(
    () => ThemeCubit(),
  );

  // Auth.
  getIt.registerLazySingleton<AuthService>(
    () => AuthServiceMock(),
  );

  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(authService: getIt()),
  );

  // Me
  getIt.registerLazySingleton<MeService>(
    () => MeServiceMock(),
  );

  getIt.registerFactory<MeCubit>(
    () => MeCubit(meService: getIt()),
  );

  // Project
  getIt.registerLazySingleton<ProjectService>(
    () => ProjectServiceMock(),
  );

  getIt.registerFactory<ProjectListCubit>(
    () => ProjectListCubit(projectService: getIt()),
  );

  getIt.registerFactory<ProjectDetailCubit>(
    () => ProjectDetailCubit(projectService: getIt()),
  );

  // Project
  getIt.registerLazySingleton<TaskService>(
    () => TaskServiceMock(),
  );

  getIt.registerFactory<TaskListCubit>(
    () => TaskListCubit(taskService: getIt()),
  );

  getIt.registerFactory<TaskDetailCubit>(
    () => TaskDetailCubit(taskService: getIt()),
  );
}
