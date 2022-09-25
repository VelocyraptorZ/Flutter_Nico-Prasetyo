import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hotelroom {
  String room;
  String price;
  String level;

  Color color;
  Hotelroom(this.room, this.price, this.level, this.color);
}

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    List<Hotelroom> hotelroom = [
      Hotelroom(
        "Single Room",
        "Rp 350.000",
        "Economic",
        Colors.red,
      ),
      Hotelroom(
        "Twin Room",
        "Rp 750.000",
        "Reguler",
        Colors.yellow,
      ),
      Hotelroom(
        "President Suite",
        "Rp 2.350.000",
        "Premium",
        Colors.green,
      ),
      Hotelroom(
        "Deluxe Room",
        "Rp 5.750.000",
        "Reguler",
        Colors.blue,
      ),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.blue),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(200),
        title: Text(
          'About Us',
          style: GoogleFonts.dmSans(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: hotelroom.length,
        itemBuilder: (ctx, i) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          clipBehavior: Clip.hardEdge,
          //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent[100]!.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 20,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 160,
                bottom: 150,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: hotelroom[i].color,
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
              ),
              Column(
                children: [
                  ListTile(
                    title: Text('Room Price',
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700, color: Colors.black)),
                    subtitle: Text(
                      hotelroom[i].price,
                      style: TextStyle(
                          fontFamily: GoogleFonts.bebasNeue().fontFamily,
                          color: Colors.green,
                          fontSize: 28),
                    ),
                  ),
                  Image.asset('assets/image/Room.png'),
                  ListTile(
                    title: Text(hotelroom[i].room),
                    subtitle: Text(
                      hotelroom[i].level,
                      style: TextStyle(
                        fontFamily: GoogleFonts.dmSans().fontFamily,
                        color: Colors.yellow[700],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
