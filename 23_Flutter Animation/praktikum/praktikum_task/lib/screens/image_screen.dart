import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  bool isTapped = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Resize With Animation')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          child: Center(
            child: AnimatedContainer(
              height: isTapped ? 200 : 500,
              width: isTapped ? 200 : 500,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Earth.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
