import 'package:flutter/material.dart';
import 'package:weekly_task2/screen/contactus_screen.dart';
import 'package:weekly_task2/screen/welcome_screen.dart';
import 'drawer/drawer.dart';

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
        drawer: const DrawerScreen(),
        appBar: AppBar(
          title: Row(children: const [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/image/Logo.png'),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Hotel Reservation"))
          ]),
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
