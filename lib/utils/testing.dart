import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:netflix/theme/theme.dart';
import 'package:provider/provider.dart';

abstract class TestRouter {
  GoRouter get router;
}

extension PumpProvider on WidgetTester {
  Future<void> pumpWithMaterialAndScaffold(Widget child) async {
    return pumpWidget(MaterialApp(
      theme: theme,
      home: Scaffold(body: child),
    ));
  }

  Future<void> pumpWithMaterialApp({
    required Widget child,
  }) async {
    return pumpWidget(MaterialApp(
      home: child,
      theme: theme,
    ));
  }

  Future<void> pumpWithRoutes(
      {required Widget child, required TestRouter router}) async {
    return pumpWidget(MultiProvider(
        providers: [Provider<TestRouter>(create: (_) => router)],
        child: Builder(
          builder: (context) {
            final GoRouter goRouter =
                Provider.of<TestRouter>(context, listen: false).router;

            return MaterialApp.router(
              theme: theme,
              routerConfig: goRouter,
            );
          },
        )));
  }
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
