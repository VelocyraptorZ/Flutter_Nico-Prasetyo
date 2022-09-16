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
            leading: Text('Edit'),
            trailing: Icon(Icons.edit),
            middle: Text('Yolo'),
          ),
          child: Center(
            child: CupertinoSearchTextField(),
          ),
        ));
  }
}
