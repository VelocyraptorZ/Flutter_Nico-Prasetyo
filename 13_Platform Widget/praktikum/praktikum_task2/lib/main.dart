import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        title: 'Flutter Demo',
        theme: CupertinoThemeData(),
        home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: Icon(CupertinoIcons.settings),
            trailing: Icon(CupertinoIcons.pencil_circle),
            middle: Text('Chats'),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 85, right: 10, left: 10),
            child: CupertinoSearchTextField(),
          ),
        ));
  }
}

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Column(
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
    ));
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
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(30),
                // border: Border.all(width: 1),
                color: isRead ? Colors.green : Colors.white,
              ),
              // child: Padding(
              // padding: const EdgeInsets.all(7),
              child: Text(
                message,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
