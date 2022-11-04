import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/category/category_view_model.dart';
import 'screens/detail/movie_detail_view_model.dart';
import 'package:cinema/screens/contactus/contactus_view_model.dart';
import 'screens/home/home_view_model.dart';
import 'screens/person/person_view_model.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MovieViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => GenreViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => PersonViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => MovieDetailViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ContactUsViewModel(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences logindata;
  bool newUser = false;

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  Future<void> checkLogin() async {
    final logindatacheck = await SharedPreferences.getInstance();
    setState(() {
      logindata = logindatacheck;
      newUser = logindata.getBool('login') ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CINEMA',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: newUser == false ? const HomeScreen() : const LoginScreen(),
    );
  }
}
