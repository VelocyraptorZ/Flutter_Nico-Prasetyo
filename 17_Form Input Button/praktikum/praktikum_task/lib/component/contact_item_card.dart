import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/contact_model.dart';

class ContactItemCard extends StatelessWidget {
  final ContactModel contact;
  final Function() onPressed;
  final _random = Random();

  ContactItemCard({super.key, required this.contact, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(
            contact.contactName,
            style: GoogleFonts.poppins(),
          ),
          subtitle: Text(
            contact.contactNumber,
            style: GoogleFonts.poppins(),
          ),
          leading: CircleAvatar(
            backgroundColor:
                Colors.primaries[_random.nextInt(Colors.primaries.length)]
                    [_random.nextInt(9) * 100],
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                contact.contactName.split('').first,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(
                    'Delete Contact?',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'NO',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: onPressed,
                      child: Text(
                        'YES',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete_forever_rounded),
          ),
        ),
      ],
    );
  }
}
