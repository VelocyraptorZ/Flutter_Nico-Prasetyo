import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyBadges(),
    );
  }
}

class MyBadges extends StatefulWidget {
  const MyBadges({Key? key}) : super(key: key);

  @override
  State<MyBadges> createState() => _MyBadgesState();
}

class _MyBadgesState extends State<MyBadges> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badges'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // expandedChip(),
            // expandedBadge(),
            const Chip(
              padding: EdgeInsets.all(0),
              backgroundColor: Colors.deepPurple,
              label: Text('BADGE', style: TextStyle(color: Colors.white)),
            ),
            Badge(
              toAnimate: false,
              shape: BadgeShape.square,
              badgeColor: Colors.deepPurple,
              borderRadius: BorderRadius.circular(30),
              badgeContent:
                  const Text('BADGE', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget expandedChip() {
    // ignore: prefer_const_constructors
    return Chip(
      padding: const EdgeInsets.all(0),
      backgroundColor: Colors.deepPurple,
      label: const Text('BADGE', style: TextStyle(color: Colors.white)),
    );
  }

  Widget expandedBadge() {
    // ignore: prefer_const_constructors
    return Badge(
      toAnimate: false,
      shape: BadgeShape.square,
      badgeColor: Colors.deepPurple,
      borderRadius: BorderRadius.circular(30),
      badgeContent: const Text('BADGE', style: TextStyle(color: Colors.white)),
    );
  }
}
