import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: const CupertinoThemeData(),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Align(
            widthFactor: 1.0,
            alignment: Alignment.center,
            child: GestureDetector(
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: CupertinoColors.activeBlue,
                ),
              ),
              onTap: () {},
            ),
          ),
          trailing: const Icon(CupertinoIcons.pencil_circle),
          middle: const Text('Chats'),
        ),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 65, right: 15, left: 15),
                child: CupertinoSearchTextField()),
            const Expanded(
              child: CupertinoTabBarExample(),
            ),
          ],
        ),
      ),
    );
  }
}

class CupertinoTabBarExample extends StatelessWidget {
  const CupertinoTabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_crop_circle_fill),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone_fill),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            // ignore: prefer_const_constructors
            return AllChats();
          },
        );
      },
    );
  }
}

class User {
  String name;
  String desc;
  String url;
  String time;
  String messages;
  bool isRead;

  User(
      {required this.name,
      required this.desc,
      required this.url,
      required this.time,
      required this.messages,
      required this.isRead});
}

// ignore: must_be_immutable
class Chat extends StatefulWidget {
  String name;
  String desc;
  String url;
  String time;
  String messages;
  bool isRead;

  Chat({
    super.key,
    required this.name,
    required this.desc,
    required this.url,
    required this.time,
    required this.isRead,
    required this.messages,
  });
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: ExactAssetImage(widget.url),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: CupertinoColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.desc,
                            // ignore: prefer_const_constructors
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      widget.time,
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(30),
                      color: widget.isRead
                          ? CupertinoColors.white
                          : CupertinoColors.activeGreen,
                    ),
                    //apply padding to all four sides
                    child: Text(
                      widget.messages,
                      style: const TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.white,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AllChats extends StatelessWidget {
  const AllChats({super.key});

  @override
  Widget build(BuildContext context) {
    List<User> users = [
      User(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: ' 5 ',
          isRead: false),
      User(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: true),
      User(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: false),
      User(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: true),
      User(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: false),
      User(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: true),
      User(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: true),
    ];

    return CupertinoPageScaffold(
      child: ListView.builder(
        itemCount: users.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 16),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Chat(
            name: users[index].name,
            desc: users[index].desc,
            url: users[index].url,
            time: users[index].time,
            isRead: (users[index].messages == '0') ? true : false,
            messages: users[index].messages,
          );
        },
      ),
    );
  }
}
