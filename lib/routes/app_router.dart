import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page/home_page.dart';

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
)
@immutable
class HomePageRoute extends GoRouteData {
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
