import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netflix/utils/testing.dart';
import 'package:netflix/utils/assets.dart';
import 'package:netflix/widget/user_splash.dart';

void main() {
  testWidgets('UserIcon should render correctly when isEditing is false',
      (WidgetTester tester) async {
    await tester.pumpWithMaterialApp(
        child: UserIcon(
      name: "Julio",
      isEditing: false,
      onPressed: () {},
      iconUrl: NetflixIcons.netflix,
    ));

    final title = find.text("Julio");
    final image = find.byType(Image);

    const String matchedContainer =
        "(Container(bg: BoxDecoration(color: Color(0x00000000)), constraints: BoxConstraints(biggest)))";
    final container = find.byType(Container);

    expect(title, findsOneWidget);
    expect(image, findsOneWidget);
    expect(container.evaluate().toString(), matchedContainer);
  });

  testWidgets('UserIcon should render correctly when isEditing is true',
      (WidgetTester tester) async {
    await tester.pumpWithMaterialApp(
        child: UserIcon(
      name: "Julio",
      isEditing: true,
      onPressed: () {},
      iconUrl: NetflixIcons.netflix,
    ));

    final title = find.text("Julio");
    final image = find.byType(Image);

    const String matchedContainer =
        "(Container(bg: BoxDecoration(color: Color(0x7f000000)), constraints: BoxConstraints(biggest)))";
    final container = find.byType(Container);

    expect(title, findsOneWidget);
    expect(image, findsOneWidget);
    expect(container.evaluate().toString(), matchedContainer);
  });

  testWidgets('UserIcon call func when is tapped', (WidgetTester tester) async {
    int counter = 0;

    await tester.pumpWithMaterialApp(
        child: Container(
      margin: const EdgeInsets.only(
        top: 400,
        right: 300,
      ),
      child: UserIcon(
        name: "Julio",
        isEditing: true,
        onPressed: () {
          counter += 1;
        },
        iconUrl: NetflixIcons.netflix,
      ),
    ));

    await tester.tap(find.byType(GestureDetector));

    await tester.pumpAndSettle();

    expect(counter, 1);
  });
}
