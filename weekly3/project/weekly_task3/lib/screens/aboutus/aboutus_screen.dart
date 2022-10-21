import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/hotelroom_model.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    List<HotelRoom> hotelroom = [
      HotelRoom(
        room: "Single Room",
        price: "Rp 350.000",
        level: "Economic",
        color: Colors.red,
      ),
      HotelRoom(
        room: "Twin Room",
        price: "Rp 750.000",
        level: "Reguler",
        color: Colors.yellow,
      ),
      HotelRoom(
        room: "President Suite",
        price: "Rp 2.350.000",
        level: "Premium",
        color: Colors.green,
      ),
      HotelRoom(
        room: "Deluxe Room",
        price: "Rp 5.750.000",
        level: "Reguler",
        color: Colors.blue,
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
