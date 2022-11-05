// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cinema/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login Screen', () {
    testWidgets('Testing Form Validator', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));

      expect(find.byType(LoginScreen), findsWidgets);

      expect(find.text('Login'), findsOneWidget);

      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pump();

      expect(find.text('Enter at least 4 characters'), findsOneWidget);
      expect(find.text('Enter a valid email'), findsOneWidget);
      expect(find.text('Enter min. 5 characters'), findsOneWidget);

      await tester.tap(find.widgetWithText(TextFormField, 'Username'));
      await tester.pump(const Duration(milliseconds: 1000));
      await tester.tap(find.widgetWithText(TextFormField, 'Email'));
      await tester.pump(const Duration(milliseconds: 1000));
      await tester.tap(find.widgetWithText(TextFormField, 'Password'));
      await tester.pump(const Duration(milliseconds: 1000));

      Finder username = find.widgetWithText(TextFormField, 'Username');
      Finder email = find.widgetWithText(TextFormField, 'Email');
      Finder password = find.widgetWithText(TextFormField, 'Password');

      await tester.enterText(username, "Nico Prasetyo");
      await tester.enterText(email, "khokhonicho@gmail.com");
      await tester.enterText(password, "testingpassword");
      await tester.pump();

      expect(find.text('Nico Prasetyo'), findsOneWidget);
      expect(find.text('khokhonicho@gmail.com'), findsOneWidget);
      expect(find.text('testingpassword'), findsOneWidget);

      expect(find.text('Enter at least 4 characters'), findsNothing);
      expect(find.text('Enter a valid email'), findsNothing);
      expect(find.text('Enter min. 5 characters'), findsNothing);
    });
  });
}
