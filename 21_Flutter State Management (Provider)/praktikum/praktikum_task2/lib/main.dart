import 'package:flutter/material.dart';
import 'package:praktikum_task2/screens/contact_screen.dart';
import 'package:provider/provider.dart';
import 'models/contact_manager.dart';

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
          create: (context) => ContactManager(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Management With Provider',
        home: ContactScreen(),
      ),
    );
  }
}
