import 'package:flutter/cupertino.dart';

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
      home: const CupertinoTabBarExample(),
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
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: Align(
                  widthFactor: 1.0,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Color.fromARGB(0, 29, 29, 213),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                trailing: const Icon(CupertinoIcons.pencil_circle),
                middle: const Text('Chats'),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 45, right: 15, left: 15),
                child: CupertinoSearchTextField(),
              ),
            );
          },
        );
      },
    );
  }
}
