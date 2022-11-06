import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension Provider on WidgetTester {
  Future<void> pumpWithMaterialAndScaffold(Widget child) async {
    return pumpWidget(MaterialApp(
      home: Scaffold(body: child),
    ));
  }

  Future<void> pumpWithMaterialApp(Widget child) async {
    return pumpWidget(MaterialApp(
      home: child,
    ));
  }
}
