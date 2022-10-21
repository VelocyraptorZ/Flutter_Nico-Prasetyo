import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/reservation_model.dart';

class ReservationItem extends StatelessWidget {
  final ReservationModel reservation;
  final Function() onPressed;

  const ReservationItem(
      {super.key, required this.reservation, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          'Name : ${reservation.FirstName} ${reservation.LastName}',
          style: GoogleFonts.poppins(),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email : ${reservation.Email}',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Problem : ${reservation.Problem}',
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
    );
  }
}
