import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/pages/change_language.dart';
import 'package:netflix/pages/choose_profile.dart';
import 'package:netflix/pages/edit_profile.dart';
import 'package:netflix/pages/legend_exibition.dart';
import 'package:netflix/router/route_utils.dart';
import 'package:netflix/utils/testing.dart';
import 'package:netflix/widget/button.dart';

class EditProfileTestRouter implements TestRouter {
  @override
  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        redirect: (_, __) => Pages.editProfile.toPath,
      ),
      GoRoute(
          path: Pages.editProfile.toPath,
          name: Pages.editProfile.toName,
          builder: (_, state) {
            return const EditProfile();
          }),
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
    ],
  );
}

void main() {
  testWidgets('EditProfile should render correctly',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(10000, 10000);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWithMaterialApp(child: const EditProfile(name: "Carlos"));

    Finder nameFinder = find.text("Carlos");
    Finder editTiles = find.byType(EditTile);

    Finder scaffoldFinder = find.byType(Scaffold);

    Scaffold scaffold = scaffoldFinder.evaluate().first.widget as Scaffold;
    Container floatingActionButton = scaffold.floatingActionButton as Container;
    floatingActionButton.child is Button;

    expect(nameFinder, findsNWidgets(2));
    expect(editTiles, findsNWidgets(6));
    expect(floatingActionButton.child is Button, true);
  });

  testWidgets('EditProfile should navigate show dialog',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(10000, 10000);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWithMaterialApp(child: const EditProfile(name: "Carlos"));

    Finder openPopUp = find.widgetWithText(EditTile, "Classificação etária");

    Finder popUp = find.byType(ClassificationPopUp);

    expect(popUp, findsNothing);

    await tester.tap(openPopUp);
    await tester.pumpAndSettle();

    popUp = find.byType(ClassificationPopUp);
    expect(popUp, findsOneWidget);
  });

  testWidgets(
      'EditProfile should navigate navigate to ChangeLanguage when tapping button with false parameter',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(10000, 10000);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWithRoutes(
        child: const EditProfile(name: "Carlos"),
        router: EditProfileTestRouter());

    Finder navigate = find.widgetWithText(EditTile, "Idioma de exibição");

    Finder newPage = find.byType(ChangeLanguage);

    expect(newPage, findsNothing);

    await tester.tap(navigate);
    await tester.pumpAndSettle();

    newPage = find.byType(ChangeLanguage);
    ChangeLanguage changeLangueage =
        newPage.evaluate().first.widget as ChangeLanguage;
    expect(changeLangueage.isCheckbox, false);
  });

  testWidgets(
      'EditProfile should navigate navigate to ChangeLanguage when tapping button with true parameter',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(10000, 10000);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWithRoutes(
        child: const EditProfile(name: "Carlos"),
        router: EditProfileTestRouter());

    Finder navigate =
        find.widgetWithText(EditTile, "Idioma de áudio e legendas");

    Finder newPage = find.byType(ChangeLanguage);

    expect(newPage, findsNothing);

    await tester.tap(navigate);
    await tester.pumpAndSettle();

    newPage = find.byType(ChangeLanguage);
    ChangeLanguage changeLangueage =
        newPage.evaluate().first.widget as ChangeLanguage;
    expect(changeLangueage.isCheckbox, true);
  });

  testWidgets(
      'EditProfile should navigate to LegendExibitionPage when tapping button',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(10000, 10000);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWithRoutes(
        child: const EditProfile(name: "Carlos"),
        router: EditProfileTestRouter());

    Finder navigate = find.widgetWithText(EditTile, "Exibição das legendas");

    Finder newPage = find.byType(LegendExibitionPage);

    expect(newPage, findsNothing);

    await tester.tap(navigate);
    await tester.pumpAndSettle();

    newPage = find.byType(LegendExibitionPage);
    expect(newPage, findsOneWidget);
  });

  testWidgets('EditProfile should updated switch states when switch is clicked',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(10000, 10000);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWithRoutes(
        child: const EditProfile(name: "Carlos"),
        router: EditProfileTestRouter());

    Finder switches = find.byType(Switch);

    Switch changeReplayWidget =
        switches.evaluate().elementAt(0).widget as Switch;

    Switch changePreviewWidget =
        switches.evaluate().elementAt(1).widget as Switch;

    expect(changePreviewWidget.value, false);
    expect(changeReplayWidget.value, false);

    await tester.tap(switches.at(0));
    await tester.pumpAndSettle();
    changeReplayWidget = switches.evaluate().elementAt(0).widget as Switch;

    changePreviewWidget = switches.evaluate().elementAt(1).widget as Switch;

    expect(changePreviewWidget.value, false);
    expect(changeReplayWidget.value, true);
    await tester.tap(switches.at(1));
    await tester.pumpAndSettle();

    changeReplayWidget = switches.evaluate().elementAt(0).widget as Switch;

    changePreviewWidget = switches.evaluate().elementAt(1).widget as Switch;

    expect(changePreviewWidget.value, true);
    expect(changeReplayWidget.value, true);
  });
}
