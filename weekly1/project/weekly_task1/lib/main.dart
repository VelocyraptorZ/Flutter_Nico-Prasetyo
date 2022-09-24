import 'package:flutter/material.dart';
import 'package:weekly_task1/screen/contactus_screen.dart';
import 'package:weekly_task1/screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: const CircleAvatar(
              radius: 30, backgroundImage: AssetImage('assets/image/Logo.png')),
          title: const Text('Hotel Reservation'),
        ),
        body: ListView(
          children: const [
            Welcome(),
            ContactUs(),
          ],
        ),
      ),
    );
  }
}
