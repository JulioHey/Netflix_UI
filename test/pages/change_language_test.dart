import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netflix/pages/change_language.dart';
import 'package:netflix/utils/languages.dart';
import 'package:netflix/utils/testing.dart';

const String unselectedContainer =
    "Container(bg: BoxDecoration(color: Color(0x00000000), border: Border.all(BorderSide(Color(0xffffffff), 1.0, BorderStyle.solid)), borderRadius: BorderRadius.circular(10.0)), constraints: BoxConstraints(w=20.0, h=20.0))";
const String selectedContainer =
    "Container(bg: BoxDecoration(color: Color(0xfff44336), border: Border.all(BorderSide(Color(0xffffffff), 1.0, BorderStyle.solid)), borderRadius: BorderRadius.circular(10.0)), constraints: BoxConstraints(w=20.0, h=20.0))";

void main() {
  testWidgets('ChangeLanguage should render exacly number of languages',
      (WidgetTester tester) async {
    await tester.pumpWithMaterialApp(
        child: const ChangeLanguage(isCheckbox: true));

    Finder container = find.byType(Container);

    expect(container, findsNWidgets(languages.length));
  });

  testWidgets('ChangeLanguage should render correctly when is checkbox is true',
      (WidgetTester tester) async {
    await tester.pumpWithMaterialApp(
        child: const ChangeLanguage(isCheckbox: true));

    Finder container = find.byType(Container);

    expect(container.first.evaluate().toString().contains("BorderRadius.zero"),
        true);
  });

  testWidgets(
      'ChangeLanguage should render correctly when is checkbox is false',
      (WidgetTester tester) async {
    await tester.pumpWithMaterialApp(
        child: const ChangeLanguage(isCheckbox: false));

    Finder container = find.byType(Container);

    expect(
        container.first
            .evaluate()
            .toString()
            .contains("BorderRadius.circular(10.0)"),
        true);
  });

  testWidgets(
      'ChangeLanguage change styles when another language is selected and checkbox is false',
      (WidgetTester tester) async {
    const String unselectedContainer =
        "Container(bg: BoxDecoration(color: Color(0x00000000), border: Border.all(BorderSide(Color(0xffffffff), 1.0, BorderStyle.solid)), borderRadius: BorderRadius.circular(10.0)), constraints: BoxConstraints(w=20.0, h=20.0))";
    const String selectedContainer =
        "Container(bg: BoxDecoration(color: Color(0xfff44336), border: Border.all(BorderSide(Color(0xffffffff), 1.0, BorderStyle.solid)), borderRadius: BorderRadius.circular(10.0)), constraints: BoxConstraints(w=20.0, h=20.0))";

    await tester.pumpWithMaterialApp(
        child: const ChangeLanguage(isCheckbox: false));
    await tester.pumpAndSettle();

    Finder english = find.widgetWithText(ListTile, "English");
    Finder portugues = find.widgetWithText(ListTile, "Português");

    ListTile englishTile = english.evaluate().first.widget as ListTile;
    ListTile portuguesTile = portugues.evaluate().first.widget as ListTile;

    expect(englishTile.leading.toString(), unselectedContainer);
    expect(portuguesTile.leading.toString(), selectedContainer);

    await tester.tap(english.first);

    await tester.pumpAndSettle();

    englishTile = english.evaluate().first.widget as ListTile;
    portuguesTile = portugues.evaluate().first.widget as ListTile;

    expect(englishTile.leading.toString(), selectedContainer);
    expect(portuguesTile.leading.toString(), unselectedContainer);
  });

  testWidgets(
      'ChangeLanguage change styles when another language is selected and checkbox is true',
      (WidgetTester tester) async {
    const String unselectedContainer =
        "Container(bg: BoxDecoration(color: Color(0x00000000), border: Border.all(BorderSide(Color(0xffffffff), 1.0, BorderStyle.solid)), borderRadius: BorderRadius.zero), constraints: BoxConstraints(w=20.0, h=20.0))";
    const String selectedContainer =
        "Container(bg: BoxDecoration(color: Color(0xfff44336), border: Border.all(BorderSide(Color(0xffffffff), 1.0, BorderStyle.solid)), borderRadius: BorderRadius.zero), constraints: BoxConstraints(w=20.0, h=20.0))";

    await tester.pumpWithMaterialApp(
        child: const ChangeLanguage(isCheckbox: true));
    await tester.pumpAndSettle();

    Finder english = find.widgetWithText(ListTile, "English");
    Finder portugues = find.widgetWithText(ListTile, "Português");

    ListTile englishTile = english.evaluate().first.widget as ListTile;
    ListTile portuguesTile = portugues.evaluate().first.widget as ListTile;

    expect(englishTile.leading.toString(), unselectedContainer);
    expect(portuguesTile.leading.toString(), selectedContainer);

    await tester.tap(english.first);

    await tester.pumpAndSettle();

    englishTile = english.evaluate().first.widget as ListTile;
    portuguesTile = portugues.evaluate().first.widget as ListTile;

    expect(englishTile.leading.toString(), selectedContainer);
    expect(portuguesTile.leading.toString(), selectedContainer);
  });
}
