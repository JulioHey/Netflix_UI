import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/pages/splash_screen.dart';
import 'package:netflix/router/route_utils.dart';

class AppRouter {
  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: "/",
      redirect: (_, __) => Pages.splashScreen.toPath,
    ),
    GoRoute(
        path: Pages.splashScreen.toPath,
        name: Pages.splashScreen.toName,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen())
  ]);
}
