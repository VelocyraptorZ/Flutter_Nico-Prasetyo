import 'package:flutter/material.dart';
import 'package:praktikum_task1/models/user_manager.dart';
import 'package:praktikum_task1/screens/register_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserManager(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shared Preferences With Provider',
          home: RegisterScreen()),
    );
  }
}
