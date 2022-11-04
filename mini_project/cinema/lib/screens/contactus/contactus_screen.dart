import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contactus_form_screen.dart';
import 'contactus_list_screen.dart';
import 'contactus_view_model.dart';
import 'empty/empty_reservation_screen.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Contact Us',
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
              builder: (context) => const ContactUsFormScreen(),
            ),
          );
        },
      ),
      body: buildTaskScreen(),
    );
  }

  Widget buildTaskScreen() {
    return Consumer<ContactUsViewModel>(
      builder: (context, manager, child) {
        if (manager.contactusModels.isNotEmpty) {
          return ContactUsListScreen(
            manager: manager,
          );
        } else {
          return const EmptyContactUsScreen();
        }
      },
    );
  }
}
