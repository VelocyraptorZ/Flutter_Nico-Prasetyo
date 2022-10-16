import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'screens/contact/contact_screen.dart';
import 'screens/contact/contact_view_model.dart';
import 'screens/home/home_view_model.dart';
import 'screens/program/program_screen.dart';
import 'screens/program/program_view_model.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ContactViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => ProgramViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => HomeViewModel(),
          ),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: ListView(
              children: const [
                SizedBox(
                  height: 400,
                  child: ProgramScreen(),
                ),
                SizedBox(
                  height: 400,
                  child: ContactScreen(),
                ),
              ],
            ),
          ),
        )),
  );
}
