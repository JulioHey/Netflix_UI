import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/router/router.dart';
import 'package:netflix/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider<AppRouter>(create: (_) => AppRouter())],
        child: Builder(
          builder: (context) {
            final GoRouter goRouter =
                Provider.of<AppRouter>(context, listen: false).router;
            return MaterialApp.router(
              theme: theme,
              routerConfig: goRouter,
            );
          },
        ));
  }
}
