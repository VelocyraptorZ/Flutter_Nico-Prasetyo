import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/post_manager.dart';
import 'screen/post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PostManager(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PreviewPost',
        home: PostScreen(),
      ),
    );
  }
}
