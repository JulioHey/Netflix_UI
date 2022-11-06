import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netflix/utils/testing.dart';
import 'package:netflix/widget/input.dart';

void main() {
  testWidgets('Input should render correctly', (WidgetTester tester) async {
    TextEditingController controller = TextEditingController(text: "");

    await tester.pumpWithMaterialAndScaffold(Input(controller: controller));

    Finder containerFinder = find.byType(Container);
    Finder formFieldFinder = find.byType(TextFormField);

    const String expectedContainers =
        "(Container(padding: EdgeInsets(10.0, 0.0, 10.0, 10.0), bg: BoxDecoration(color: Color(0xff828282), borderRadius: BorderRadius.circular(8.0))), Container(margin: EdgeInsets.zero))";

    expect(containerFinder.evaluate().toString(), expectedContainers);
    expect(formFieldFinder, findsOneWidget);
  });

  testWidgets("Input should update controller when type",
      (WidgetTester tester) async {
    TextEditingController controller = TextEditingController(text: "");

    await tester.pumpWithMaterialAndScaffold(Input(controller: controller));

    Finder formFieldFinder = find.byType(TextFormField);

    await tester.enterText(formFieldFinder, "TESTANDO");

    expect(controller.value.text, "TESTANDO");
  });
}
