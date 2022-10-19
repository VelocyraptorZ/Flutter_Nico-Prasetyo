import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../empty/empty_reservation_screen.dart';
import 'reservation_form_screen.dart';
import 'reservation_list_screen.dart';
import 'reservation_view_model.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data reservation',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ReservationFormScreen(),
            ),
          );
        },
      ),
      body: buildTaskScreen(),
    );
  }

  Widget buildTaskScreen() {
    return Consumer<ReservationViewModel>(
      builder: (context, manager, child) {
        if (manager.reservationModels.isNotEmpty) {
          return ReservationListScreen(
            manager: manager,
          );
        } else {
          return const EmptyReservationScreen();
        }
      },
    );
  }
}
