// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_calulator/main.dart';

void main() {
  testWidgets('Calculator displays and updates output', (WidgetTester tester) async {
    // Build the calculator app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the calculator output is initially empty.
    expect(find.text(''), findsOneWidget);

    // Tap the '1' button and trigger a frame.
    await tester.tap(find.text('1'));
    await tester.pump();
    // Output should update to '1'
    expect(find.text('1'), findsOneWidget);

    // Tap the '+' button
    await tester.tap(find.text('+'));
    await tester.pump();
    // Output should still show '1+'
    expect(find.text('1+'), findsOneWidget);

    // Tap the '2' button
    await tester.tap(find.text('2'));
    await tester.pump();
    // Output should show '1+2'
    expect(find.text('1+2'), findsOneWidget);

    // Tap the '=' button
    await tester.tap(find.text('='));
    await tester.pump();
    // Output should show '3' (the result of 1+2)
    expect(find.text('3'), findsOneWidget);
  });
}
