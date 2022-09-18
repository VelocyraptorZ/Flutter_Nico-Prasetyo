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
                padding:
                    EdgeInsets.only(top: 65, right: 15, left: 15, bottom: 20),
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

class ChatUsers {
  String name;
  String desc;
  String url;
  String time;
  String messages;
  bool isRead;

  ChatUsers(
      {required this.name,
      required this.desc,
      required this.url,
      required this.time,
      required this.messages,
      required this.isRead});
}

// ignore: must_be_immutable
class ConversationList extends StatefulWidget {
  String name;
  String desc;
  String url;
  String time;
  String messages;
  bool isRead;

  ConversationList({
    super.key,
    required this.name,
    required this.desc,
    required this.url,
    required this.time,
    required this.isRead,
    required this.messages,
  });
  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
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
                    backgroundImage: ExactAssetImage(widget.url),
                    backgroundColor: CupertinoColors.white,
                    maxRadius: 30,
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
    List<ChatUsers> chatUsers = [
      ChatUsers(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "praktikum_task2/assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: false),
      ChatUsers(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: true),
      ChatUsers(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: false),
      ChatUsers(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: true),
      ChatUsers(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: false),
      ChatUsers(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: true),
      ChatUsers(
          name: "Pink Guy",
          desc: "Hey Bous!",
          url: "assets/PinkGuy.png",
          time: "12:00 PM",
          messages: " 5 ",
          isRead: true),
    ];

    return CupertinoPageScaffold(
        child: SingleChildScrollView(
      child: ListView.builder(
        itemCount: chatUsers.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 16),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ConversationList(
            name: chatUsers[index].name,
            desc: chatUsers[index].desc,
            url: chatUsers[index].url,
            time: chatUsers[index].time,
            isRead: (chatUsers[index].messages == '0') ? true : false,
            messages: chatUsers[index].messages,
          );
        },
      ),
    ));
  }
}

// class Chats extends StatefulWidget {
//   const Chats({Key? key}) : super(key: key);

//   @override
//   State<Chats> createState() => _ChatsState();
// }

// class _ChatsState extends State<Chats> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//         child: Column(
//       children: [
//         list(
//             url: 'assets/PinkGuy.png',
//             name: "Pink Guy",
//             time: "12:00 PM",
//             desc: "Heyy Bous!",
//             message: " 2 ",
//             isRead: true),
//         const Divider(height: 0.2),
//         list(
//             url: 'assets/Snoop.png',
//             name: "Snoop Dogg",
//             time: "8:30 PM",
//             desc: "Smoke Weed Everyday",
//             message: " 2 ",
//             isRead: false),
//         const Divider(height: 0.2),
//         list(
//             url: 'assets/Bjorka.png',
//             name: "Bjorka",
//             time: "05:30 PM",
//             desc: "Sir, This is all Indonesian government data ",
//             message: " 2 ",
//             isRead: false),
//         const Divider(height: 0.2),
//         list(
//             url: 'assets/KimJongUn.png',
//             name: "Kim Jong-un",
//             time: "12:00 AM",
//             desc: "Wait for me, will show you the real NUKE! ",
//             message: " 5 ",
//             isRead: true),
//         const Divider(height: 0.2),
//         list(
//             url: 'assets/Trump.png',
//             name: "Snoop Dogg",
//             time: "09:30 PM",
//             desc: "Typing...",
//             message: " 2 ",
//             isRead: false),
//         const Divider(height: 0.2),
//       ],
//     ));
//   }

//   ListView list({
//     required String url,
//     required String name,
//     required String time,
//     required String desc,
//     required String message,
//     required bool isRead,
//   }) {
//     return ListView.builder(itemBuilder: (BuildContext context, int index) {
//       return Container(
//         padding:
//             const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   CircleAvatar(
//                     backgroundImage: ExactAssetImage(url),
//                     backgroundColor: CupertinoColors.white,
//                     maxRadius: 30,
//                   ),
//                   const SizedBox(
//                     width: 16,
//                   ),
//                   Expanded(
//                     child: Container(
//                       color: CupertinoColors.white,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             name,
//                             style: const TextStyle(fontSize: 16),
//                           ),
//                           const SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             desc,
//                             style: TextStyle(
//                                 fontSize: 13,
//                                 color: CupertinoColors.systemGrey,
//                                 fontWeight: isRead
//                                     ? FontWeight.normal
//                                     : FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       time,
//                       // ignore: prefer_const_constructors
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     // shape: BoxShape.circle,
//                     borderRadius: BorderRadius.circular(30),
//                     // border: Border.all(width: 1),
//                     color: isRead ? Colors.green : Colors.white,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(
//                         7), //apply padding to all four sides
//                     child: Text(
//                       message,
//                       style: const TextStyle(
//                         color: CupertinoColors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
