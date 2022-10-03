import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/contact_manager.dart';
import 'contact_item_screen.dart';
import 'contact_list_screen.dart';
import 'empty_contact_screen.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
      ),
      body: buildContactScreen(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add),
        onPressed: () {
          final manager = Provider.of<ContactManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactItemScreen(
                onCreate: (task) {
                  manager.addContact(task);
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildContactScreen() {
    return Consumer<ContactManager>(
      builder: (context, manager, child) {
        if (manager.contactModels.isNotEmpty) {
          return ContactListScreen(
            manager: manager,
          );
        } else {
          return const EmptyContactScreen();
        }
      },
    );
  }
}
