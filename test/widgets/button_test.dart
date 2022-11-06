import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netflix/utils/testing.dart';
import 'package:netflix/widget/button.dart';

void main() {
  testWidgets('Button should render correctly when no params are passed',
      (WidgetTester tester) async {
    await tester.pumpWithMaterialAndScaffold(
        Button(child: const Text("Botão"), onPressed: () {}));

    Finder containerFinder = find.widgetWithText(Container, "Botão");

    String container = containerFinder.evaluate().toString();
    const String expectedContainer =
        "(Container(padding: EdgeInsets(0.0, 12.0, 0.0, 12.0), bg: BoxDecoration))";

    expect(containerFinder, findsOneWidget);
    expect(container, expectedContainer);
  });

  testWidgets('Button should render correctly when paddding is passed',
      (WidgetTester tester) async {
    await tester.pumpWithMaterialAndScaffold(Button(
      onPressed: () {},
      padding: const EdgeInsets.all(8),
      child: const Text("Botão"),
    ));

    Finder containerFinder = find.widgetWithText(Container, "Botão");

    String container = containerFinder.evaluate().toString();
    const String expectedContainer =
        "(Container(padding: EdgeInsets.all(8.0), bg: BoxDecoration))";

    expect(containerFinder, findsOneWidget);
    expect(container, expectedContainer);
  });

  testWidgets('Button should render correctly when boxDecoration is passed',
      (WidgetTester tester) async {
    await tester.pumpWithMaterialAndScaffold(Button(
      onPressed: () {},
      decoration: const BoxDecoration(color: Colors.white),
      child: const Text("Botão"),
    ));

    Finder containerFinder = find.widgetWithText(Container, "Botão");

    String container = containerFinder.evaluate().toString();
    const String expectedContainer =
        "(Container(padding: EdgeInsets(0.0, 12.0, 0.0, 12.0), bg: BoxDecoration(color: Color(0xffffffff))))";

    expect(containerFinder, findsOneWidget);
    expect(container, expectedContainer);
  });

  testWidgets(
      'Button should render correctly when Outlined constructor is used',
      (WidgetTester tester) async {
    await tester.pumpWithMaterialAndScaffold(Button.outlined(
      onPressed: () {},
      child: const Text("Botão"),
    ));

    Finder containerFinder = find.widgetWithText(Container, "Botão");

    String container = containerFinder.evaluate().toString();
    const String expectedContainer =
        "(Container(padding: EdgeInsets(0.0, 12.0, 0.0, 12.0), bg: BoxDecoration(border: Border.all(BorderSide(Color(0xffffffff), 1.0, BorderStyle.solid)), borderRadius: BorderRadius.circular(8.0))))";

    expect(containerFinder, findsOneWidget);
    expect(container, expectedContainer);
  });

  testWidgets('Button should call func when is tapped',
      (WidgetTester tester) async {
    int counter = 0;
    await tester.pumpWithMaterialAndScaffold(Button.outlined(
      onPressed: () {
        counter += 1;
      },
      child: const Text("Botão"),
    ));

    await tester.tap(find.byType(InkWell));

    expect(counter, 1);
  });
}
