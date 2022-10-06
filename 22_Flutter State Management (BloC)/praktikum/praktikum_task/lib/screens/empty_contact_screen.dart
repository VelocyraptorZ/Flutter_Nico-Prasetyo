import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyContactScreen extends StatelessWidget {
  const EmptyContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'contact is empty...',
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
