import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'component/contactus_item.dart';
import 'contactus_form_screen.dart';
import 'contactus_view_model.dart';

class ContactUsListScreen extends StatelessWidget {
  final ContactUsViewModel manager;
  const ContactUsListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<ContactUsViewModel>(
          builder: (context, manager, child) {
            final contactusItems = manager.contactusModels;
            return ListView.separated(
              itemCount: contactusItems.length,
              itemBuilder: (context, index) {
                final item = contactusItems[index];
                return InkWell(
                  onTap: () async {
                    final selectedTask =
                        await manager.getContactUsById(item.id!);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactUsFormScreen(
                          contactusModel: selectedTask,
                        ),
                      ),
                    );
                  },
                  child: ContactUsItem(
                    contactus: item,
                    onPressed: () {
                      manager.deleteContactUs(item.id!);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.FirstName} Deleted')),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );
          },
        ));
  }
}
