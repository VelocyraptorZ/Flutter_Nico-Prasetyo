import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_task2/bloc/user_bloc.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shared Preferences With BLoC Provider',
        home: RegisterScreen(),
      ),
    );
  }
}
