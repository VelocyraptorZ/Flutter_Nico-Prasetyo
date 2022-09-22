import 'dart:math';

import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, initialRoute: '/', routes: {
      '/': (context) => ListImage(),
      '/detail': (context) => const DetailImage(image: ''),
    }),
  );
}

class ImageItem {
  final String image;
  ImageItem(
    this.image,
  );
}

// ignore: use_key_in_widget_constructors
class ListImage extends StatefulWidget {
  @override
  State<ListImage> createState() => _ListImageState();
}

class _ListImageState extends State<ListImage> {
  final List<ImageItem> _items = [
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
    ImageItem(
      "https://picsum.photos/5000/5000?random=${rng.nextInt(99999)}",
    ),
  ];

  // ignore: prefer_typing_uninitialized_variables
  static var rng = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Task Section 16'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailImage(image: _items[index].image),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_items[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailImage extends StatelessWidget {
  final String image;

  const DetailImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Image'),
      ),
      body: Center(
        child: SizedBox(
          height: 800,
          child: Image(
            image: NetworkImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
