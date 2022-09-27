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
          const Image(
            image: AssetImage(
              'assets/images/empty_contact_background.png',
            ),
            height: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'contact masih kosong...',
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
