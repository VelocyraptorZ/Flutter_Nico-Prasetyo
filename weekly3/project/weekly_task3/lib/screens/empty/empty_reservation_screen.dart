import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyReservationScreen extends StatelessWidget {
  const EmptyReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Reservation is empty...',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
