import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netflix/pages/choose_profile.dart';
import 'package:netflix/utils/testing.dart';
import 'package:netflix/widget/user_splash.dart';

void main() {
  testWidgets(
      'ChooseProfile should render exactly number of expecteds profiles',
      (WidgetTester tester) async {
    await tester.pumpWithMaterialApp(child: const ChooseProfile());

    Finder userIconFinder = find.byType(UserIcon);
    Finder rowFinder = find.byType(Row);

    Row row = rowFinder.first.evaluate().first.widget as Row;

    expect(userIconFinder, findsNWidgets(5));
    expect(row.children.length, 3);
  });

  testWidgets(
      'ChooseProfile should changes styles of UserIcon when button is tapped',
      (WidgetTester tester) async {
    await tester.pumpWithMaterialApp(child: const ChooseProfile());

    Finder visibilityFinder = find.byType(Visibility);
    Finder gestureDetector = find.byType(GestureDetector);

    Visibility visibility =
        visibilityFinder.evaluate().first.widget as Visibility;
    expect(visibility.visible, false);

    await tester.tap(gestureDetector.first);

    await tester.pumpAndSettle();

    visibility = visibilityFinder.evaluate().first.widget as Visibility;
    expect(visibility.visible, true);

    await tester.tap(gestureDetector.first);

    await tester.pumpAndSettle();
    visibility = visibilityFinder.evaluate().first.widget as Visibility;
    expect(visibility.visible, false);
  });
}
