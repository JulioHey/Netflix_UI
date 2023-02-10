import 'package:go_router/go_router.dart';
import 'package:netflix/pages/change_language.dart';
import 'package:netflix/pages/choose_profile.dart';
import 'package:netflix/pages/edit_profile.dart';
import 'package:netflix/pages/enter.dart';
import 'package:netflix/pages/legend_exibition.dart';
import 'package:netflix/pages/login.dart';
import 'package:netflix/pages/splash_screen.dart';
import 'package:netflix/router/route_utils.dart';

class AppRouter {
  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: "/",
      redirect: (_, __) => Pages.chooseProfile.toPath,
    ),
    GoRoute(
        path: Pages.splashScreen.toPath,
        name: Pages.splashScreen.toName,
        builder: (_, __) => const SplashScreen()),
    GoRoute(
        path: Pages.editProfile.toPath,
        name: Pages.editProfile.toName,
        builder: (_, state) {
          // String name = state.extra as String;
          return const EditProfile();
        }),
    GoRoute(
        path: Pages.login.toPath,
        name: Pages.login.toName,
        builder: (_, __) => const LoginPage()),
    GoRoute(
        path: Pages.enter.toPath,
        name: Pages.enter.toName,
        builder: (_, __) => const EnterPage()),
    GoRoute(
        path: Pages.legendExibition.toPath,
        name: Pages.legendExibition.toName,
        builder: (_, __) => const LegendExibitionPage()),
    GoRoute(
        path: Pages.chooseLanguage.toPath,
        name: Pages.chooseLanguage.toName,
        builder: (_, state) {
          bool isCheckbox = state.extra as bool;
          return ChangeLanguage(
            isCheckbox: isCheckbox,
          );
        }),
    GoRoute(
        path: Pages.chooseProfile.toPath,
        name: Pages.chooseProfile.toName,
        builder: (_, __) => const ChooseProfile()),
  ]);
}
