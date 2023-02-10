import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/pages/enter.dart';
import 'package:netflix/pages/login.dart';
import 'package:netflix/router/route_utils.dart';
import 'package:netflix/utils/testing.dart';
import 'package:netflix/widget/button.dart';

class EnterPageTestRouter implements TestRouter {
  @override
  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        redirect: (_, __) => Pages.enter.toPath,
      ),
      GoRoute(
          path: Pages.enter.toPath,
          name: Pages.enter.toName,
          builder: (_, state) {
            return const EnterPage();
          }),
      GoRoute(
          path: Pages.login.toPath,
          name: Pages.login.toName,
          builder: (_, __) => const LoginPage()),
    ],
  );
}

void main() {
  group("Enter Page", () {
    testWidgets('should render corretly', (WidgetTester tester) async {
      await tester.pumpWithRoutes(
          child: const EnterPage(), router: EnterPageTestRouter());

      Finder pageView = find.byType(PageView);
      Finder vamosLaButton = find.widgetWithText(Button, "VAMOS LÁ");

      expect(pageView, findsOneWidget);
      expect(vamosLaButton, findsOneWidget);
    });

    testWidgets("should go to other page after button clicked",
        (WidgetTester tester) async {
      await tester.pumpWithRoutes(
          child: const EnterPage(), router: EnterPageTestRouter());

      await tester.pumpAndSettle();

      expect(find.byType(EnterPage), findsOneWidget);
      expect(find.byType(LoginPage), findsNothing);
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(Button, "ENTRAR"));
      await tester.pumpAndSettle();
      expect(find.byType(EnterPage), findsNothing);
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
