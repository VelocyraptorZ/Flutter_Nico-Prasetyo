import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum_task/main.dart';
import 'package:praktikum_task/screens/test_screen.dart';

void main() {
  group('MyApp', () {
    testWidgets('Test Titte', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Flutter Demo Home Page'), findsOneWidget);
    });
    testWidgets('Test Body', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ));

      expect(find.text('You have pushed the button this many times:'),
          findsOneWidget);

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    });
    testWidgets('Test Element', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });

  group('Test', () {
    testWidgets('New Screen', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Test(),
      ));

      expect(find.byType(Test), findsWidgets);

      expect(find.text('Test New Screen'), findsOneWidget);
    });
  });
}
