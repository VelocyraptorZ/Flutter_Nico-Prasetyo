import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Barcode'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarcodeWidget(
              padding: const EdgeInsets.all(10),
              barcode: Barcode.code128(),
              data: 'Alterra Academy',
              width: 200,
              height: 150,
            ),
            BarcodeWidget(
              padding: const EdgeInsets.all(10),
              barcode: Barcode.code128(),
              data: 'Flutter Asik',
              width: 200,
              height: 150,
            ),
            BarcodeWidget(
              padding: const EdgeInsets.all(10),
              barcode: Barcode.code128(),
              data: 'Nico Prasetyo',
              width: 200,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
