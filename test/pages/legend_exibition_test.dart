import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netflix/pages/legend_exibition.dart';
import 'package:netflix/utils/testing.dart';

void main() {
  group("LegendTile", () {
    testWidgets("should render correctly", (WidgetTester tester) async {
      await tester.pumpWithMaterialAndScaffold(const LegendTile(
        title: Text("Title"),
        child: Text("Child"),
      ));

      Finder titleFinder = find.textContaining("Title");
      Finder childFinder = find.textContaining("Child");

      expect(titleFinder, findsOneWidget);
      expect(childFinder, findsOneWidget);
    });
  });

  group("LegendExibitionPage", () {
    testWidgets("should render correctily", (WidgetTester tester) async {
      await tester.pumpWithMaterialApp(child: const LegendExibitionPage());

      Finder mainFinder = find.byType(LegendExibitionPage);

      Finder tilesFinder = find.byType(LegendTile);
      Finder dropDownFinder = find.byType(DropdownButtonFormField2);

      expect(mainFinder, findsOneWidget);
      expect(dropDownFinder, findsOneWidget);
      expect(tilesFinder, findsNWidgets(2));
    });
  });
}
