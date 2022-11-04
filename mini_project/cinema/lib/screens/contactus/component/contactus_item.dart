import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/contact_us_model.dart';

class ContactUsItem extends StatelessWidget {
  final ContactUsModel contactus;
  final Function() onPressed;

  const ContactUsItem(
      {super.key, required this.contactus, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          'Name : ${contactus.FirstName} ${contactus.LastName}',
          style: GoogleFonts.poppins(),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email : ${contactus.Email}',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Problem : ${contactus.Problem}',
              style: GoogleFonts.poppins(),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  'Delete Data?',
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
    );
  }
}
