import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task3/screens/form/reservation_view_model.dart';
import 'drawer/drawer.dart';
import 'screens/contactus/contactus_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ReservationViewModel(),
      )
    ],
    child: const MyApp(),
  ));
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
