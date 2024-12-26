import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/task_models/task.dart';
import '../models/task_models/task_result.dart';
import '../pages/home_page/home_page.dart';
import '../pages/preview_page/preview_page.dart';
import '../pages/process_page/process_page.dart';
import '../pages/result_list_page/result_list_page.dart';

part 'app_router.g.dart';

GoRouter getRouter() {
  return GoRouter(
    initialLocation: HomePageRoute.path,
    debugLogDiagnostics: true,
    routes: $appRoutes,
  );
}

@TypedGoRoute<HomePageRoute>(
  path: HomePageRoute.path,
  routes: [
    TypedGoRoute<ProcessPageRoute>(
      path: ProcessPageRoute.path,
      routes: [
        TypedGoRoute<ResultListRoute>(
          path: ResultListRoute.path,
          routes: [
            TypedGoRoute<PreviewRoute>(
              path: PreviewRoute.path,
            ),
          ],
        ),
      ],
    ),
  ],
)
@immutable
class HomePageRoute extends GoRouteData {
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@immutable
class ProcessPageRoute extends GoRouteData {
  static const path = 'process';

  const ProcessPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProcessPage(
      taskList: state.extra as List<Task>,
    );
  }
}

@immutable
class ResultListRoute extends GoRouteData {
  static const path = 'result-list';

  const ResultListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ResultListPage(
      resultList: state.extra as List<TaskResult>,
    );
  }
}

@immutable
class PreviewRoute extends GoRouteData {
  static const path = 'preview';

  const PreviewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PreviewPage(
      taskResult: state.extra as TaskResult,
    );
  }
}
