import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: Scaffold(
        appBar: AppBar(title: const Text('JSON ListView in Flutter')),
        body: const MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const <Widget>[
        ListTile(
          title: Text("Leanne Graham"),
          subtitle: Text("1-770-736-8031 x56442"),
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text("L", style: TextStyle(color: Colors.white)),
          ),
        ),
        ListTile(
          title: Text("Ervin Howell"),
          subtitle: Text("1-770-736-8031 x56442"),
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text("E", style: TextStyle(color: Colors.white)),
          ),
        ),
        ListTile(
          title: Text("Clementine Bauch"),
          subtitle: Text("1-770-736-8031 x56442"),
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child:
                Center(child: Text("C", style: TextStyle(color: Colors.white))),
          ),
        ),
        ListTile(
          title: Text("Patricia Lebsack"),
          subtitle: Text("1-770-736-8031 x56442"),
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text("P", style: TextStyle(color: Colors.white)),
          ),
        ),
        ListTile(
          title: Text("Chelsey Dietrich"),
          subtitle: Text("1-770-736-8031 x56442"),
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text("C", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
