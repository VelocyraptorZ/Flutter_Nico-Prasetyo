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
        title: const Text('Gallery Random Photo'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(_items[index].image),
                    ),
                  ),
                ),
              ),
              Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            DetailImage(image: _items[index].image),
                      );
                    },
                  )),
            ],
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
        title: const Text('Detail Photo'),
      ),
      body: Center(
        child: Card(
          child: InkWell(
            child: Image(
              image: NetworkImage(image),
              fit: BoxFit.fill,
            ),
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(image),
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
