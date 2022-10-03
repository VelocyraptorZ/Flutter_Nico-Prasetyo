import 'package:flutter/material.dart';
import 'package:praktikum_task2/models/contact_manager.dart';

import '../component/contact_item_card.dart';

class ContactListScreen extends StatelessWidget {
  final ContactManager manager;
  const ContactListScreen({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    final contactItems = manager.contactModels;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: contactItems.length,
        itemBuilder: (context, index) {
          final item = contactItems[index];
          return ContactItemCard(
            key: Key(item.id),
            contact: item,
            onPressed: () {
              manager.deleteContact(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.contactName} Deleted')),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
      ),
    );
  }
}
