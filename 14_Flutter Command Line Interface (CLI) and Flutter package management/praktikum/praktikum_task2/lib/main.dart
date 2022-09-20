import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyBarcode(),
    );
  }
}

class MyBarcode extends StatefulWidget {
  const MyBarcode({Key? key}) : super(key: key);

  @override
  State<MyBarcode> createState() => _MyBarcodeState();
}

class _MyBarcodeState extends State<MyBarcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Barcodes'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            barcode1(),
            barcode2(),
            barcode3(),
          ],
        ),
      ),
    );
  }

  Widget barcode1() {
    return SizedBox(
      height: 100,
      width: 100,
      child: SfBarcodeGenerator(
        value: 'ALTERRA ACADEMY',
        symbology: Code93(module: 2),
        showValue: true,
      ),
    );
  }

  Widget barcode2() {
    return SizedBox(
      height: 100,
      width: 100,
      child: SfBarcodeGenerator(
        value: 'FLUTER ASIK',
        symbology: Code93(module: 2),
        showValue: true,
      ),
    );
  }

  Widget barcode3() {
    return SizedBox(
      height: 100,
      width: 100,
      child: SfBarcodeGenerator(
        value: 'NICO PRASETYO',
        symbology: Code93(module: 2),
        showValue: true,
      ),
    );
  }
}
