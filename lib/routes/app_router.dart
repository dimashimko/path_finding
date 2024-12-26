import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/task_models/task.dart';
import '../pages/home_page/home_page.dart';
import '../pages/process_page/process_page.dart';

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
      // taskList: [],
      taskList: state.extra as List<Task>,
    );
  }
}
