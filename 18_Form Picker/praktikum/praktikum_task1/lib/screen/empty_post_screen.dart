import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyPostScreen extends StatelessWidget {
  const EmptyPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'post masih kosong...',
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
