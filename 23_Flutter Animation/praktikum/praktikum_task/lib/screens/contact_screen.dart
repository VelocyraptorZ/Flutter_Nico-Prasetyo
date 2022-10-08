import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/contact_model.dart';
import 'contact_form_screen.dart';
import 'empty_contact_screen.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<ContactModel> manager = [];
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
      ),
      body: manager.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: manager.length,
                itemBuilder: (context, index) {
                  ContactModel item = manager[index];
                  return Card(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(
                        item.contactName,
                        style: GoogleFonts.poppins(),
                      ),
                      subtitle: Text(
                        item.contactNumber,
                        style: GoogleFonts.poppins(),
                      ),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.primaries[
                                _random.nextInt(Colors.primaries.length)]
                            [_random.nextInt(9) * 100],
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            item.contactName.split('').first,
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
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              '${item.contactName} Deleted')),
                                    );
                                    setState(() {
                                      manager.removeAt(index);
                                    });
                                  },
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
                },
              ),
            )
          : const EmptyContactScreen(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add),
        onPressed: () async {
          ContactModel data = await Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return const ContactFormScreen();
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final tween =
                    Tween(begin: const Offset(1, 0), end: Offset.zero);
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
          setState(() {
            manager.add(ContactModel(
                contactName: data.contactName,
                contactNumber: data.contactNumber));
          });
        },
      ),
    );
  }
}
