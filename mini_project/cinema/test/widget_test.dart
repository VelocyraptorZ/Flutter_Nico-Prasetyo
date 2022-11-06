// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: avoid_print

import 'package:cinema/screens/login/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

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

  group('THE MOVIE DB API', () {
    test('Get Now Playing Movie', () async {
      final dio = Dio();
      final dioAdapter = DioAdapter(dio: dio);

      const baseUrl = 'https://api.themoviedb.org/3';
      const apiKey = 'api_key=b28f9cb8bea2883dc20a4d142ca9caf4';
      const url = '$baseUrl/movie/now_playing?$apiKey';

      dioAdapter.onGet(
        url,
        (request) =>
            request.reply(200, {'message': 'Successfully mocked GET!'}),
      );

      final onGetResponse = await dio.get(url);
      print(onGetResponse.data);
    });

    test('Get Movie By Genre', () async {
      final dio = Dio();
      final dioAdapter = DioAdapter(dio: dio);

      const baseUrl = 'https://api.themoviedb.org/3';
      const apiKey = 'api_key=b28f9cb8bea2883dc20a4d142ca9caf4';
      const url = '$baseUrl/discover/movie?with_genres=100&$apiKey';

      dioAdapter.onGet(
        url,
        (request) =>
            request.reply(200, {'message': 'Successfully mocked GET!'}),
      );

      final onGetResponse = await dio.get(url);
      print(onGetResponse.data);
    });
    test('Get Genre List', () async {
      final dio = Dio();
      final dioAdapter = DioAdapter(dio: dio);

      const baseUrl = 'https://api.themoviedb.org/3';
      const apiKey = 'api_key=b28f9cb8bea2883dc20a4d142ca9caf4';
      const url = '$baseUrl/genre/movie/list?$apiKey';

      dioAdapter.onGet(
        url,
        (request) =>
            request.reply(200, {'message': 'Successfully mocked GET!'}),
      );

      final onGetResponse = await dio.get(url);
      print(onGetResponse.data);
    });

    test('Get Trending Person', () async {
      final dio = Dio();
      final dioAdapter = DioAdapter(dio: dio);

      const baseUrl = 'https://api.themoviedb.org/3';
      const apiKey = 'api_key=b28f9cb8bea2883dc20a4d142ca9caf4';
      const url = '$baseUrl/trending/person/week?$apiKey';

      dioAdapter.onGet(
        url,
        (request) =>
            request.reply(200, {'message': 'Successfully mocked GET!'}),
      );

      final onGetResponse = await dio.get(url);
      print(onGetResponse.data);
    });
  });
}
