import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyContactUsScreen extends StatelessWidget {
  const EmptyContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Contact Us is empty...',
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
