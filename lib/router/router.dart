import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/pages/login.dart';
import 'package:netflix/pages/splash_screen.dart';
import 'package:netflix/router/route_utils.dart';

class AppRouter {
  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: "/",
      redirect: (_, __) => Pages.login.toPath,
    ),
    GoRoute(
        path: Pages.splashScreen.toPath,
        name: Pages.splashScreen.toName,
        builder: (_, __) => const SplashScreen()),
    GoRoute(
        path: Pages.login.toPath,
        name: Pages.login.toName,
        builder: (_, __) => const LoginPage())
  ]);
}
