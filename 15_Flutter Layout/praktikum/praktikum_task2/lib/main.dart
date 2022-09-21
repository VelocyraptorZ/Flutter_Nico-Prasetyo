import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = "GridView";

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          crossAxisCount: 4,
          children: List.generate(iconics.length, (index) {
            return Center(
              child: IconicCircle(iconic: iconics[index]),
            );
          }),
        ),
      ),
    );
  }
}

class Iconic {
  const Iconic({required this.icon});

  final IconData icon;
}

List<Iconic> iconics = [
  const Iconic(icon: Icons.agriculture_rounded),
  const Iconic(icon: Icons.airport_shuttle_rounded),
  const Iconic(icon: Icons.anchor_rounded),
  const Iconic(icon: Icons.directions_bus),
  const Iconic(icon: Icons.format_textdirection_r_to_l_rounded),
  const Iconic(icon: Icons.access_time_filled),
  const Iconic(icon: Icons.drafts),
  const Iconic(icon: Icons.dvr),
  const Iconic(icon: Icons.copyright),
  const Iconic(icon: Icons.cloud_off),
  const Iconic(icon: Icons.add_business_rounded),
  const Iconic(icon: Icons.directions_bike),
  const Iconic(icon: Icons.directions_boat),
  const Iconic(icon: Icons.directions_bus),
  const Iconic(icon: Icons.directions_railway),
  const Iconic(icon: Icons.directions_walk),
  const Iconic(icon: Icons.directions_car),
  const Iconic(icon: Icons.drafts),
  const Iconic(icon: Icons.dvr),
  const Iconic(icon: Icons.copyright),
  const Iconic(icon: Icons.cloud_off),
  const Iconic(icon: Icons.directions_car),
  const Iconic(icon: Icons.agriculture_rounded),
  const Iconic(icon: Icons.airport_shuttle_rounded),
  const Iconic(icon: Icons.anchor_rounded),
  const Iconic(icon: Icons.directions_bus),
  const Iconic(icon: Icons.format_textdirection_r_to_l_rounded),
  const Iconic(icon: Icons.account_balance_outlined),
];

class IconicCircle extends StatelessWidget {
  const IconicCircle({Key? key, required this.iconic}) : super(key: key);

  final Iconic iconic;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(child: Icon(iconic.icon, size: 20.0, color: Colors.white)),
        ]),
      ),
    );
  }
}
