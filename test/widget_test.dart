import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test/test_app.dart';

void main() {
  testWidgets('check if hello there exist test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TestApp());

    final Finder inkWell = find.byType(InkWell);
    expect(inkWell, findsOneWidget);

    await tester.tap(inkWell);
    await tester.pump();
  });
}
