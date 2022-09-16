import 'package:flutter/material.dart';
import 'drawer/drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        // leading: const Icon(Icons.menu),
        title: const Text(
          "Telegram",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.search,
                size: 30,
              ))
        ],
      ),
      // drawer: const DrawerScreen(),
      body: Column(
        children: [
          list(
              url: 'assets/PinkGuy.png',
              name: "Pink Guy",
              time: "12:00 PM",
              desc: "Heyy Bous!",
              message: " 2 ",
              isRead: true),
          const Divider(height: 0.2),
          list(
              url: 'assets/Snoop.png',
              name: "Snoop Dogg",
              time: "8:30 PM",
              desc: "Smoke Weed Everyday",
              message: " 2 ",
              isRead: false),
          const Divider(height: 0.2),
          list(
              url: 'assets/Bjorka.png',
              name: "Bjorka",
              time: "05:30 PM",
              desc: "Sir, This is all Indonesian government data ",
              message: " 2 ",
              isRead: false),
          const Divider(height: 0.2),
          list(
              url: 'assets/KimJongUn.png',
              name: "Kim Jong-un",
              time: "12:00 AM",
              desc: "Wait for me, will show you the real NUKE! ",
              message: " 5 ",
              isRead: true),
          const Divider(height: 0.2),
          list(
              url: 'assets/Trump.png',
              name: "Snoop Dogg",
              time: "09:30 PM",
              desc: "Typing...",
              message: " 2 ",
              isRead: false),
          const Divider(height: 0.2),
        ],
      ),
    );
  }

  ListTile list({
    required String url,
    required String name,
    required String time,
    required String desc,
    required String message,
    required bool isRead,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 5, left: 10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: ExactAssetImage(url),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            Text(
              time,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              desc,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // border: Border.all(width: 1),
                color: isRead ? Colors.green : Colors.white,
              ),
              child: Text(
                message,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
