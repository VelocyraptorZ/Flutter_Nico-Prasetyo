import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactScreen(),
    );
  }
}

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<ContactModel> manager = [];
  final _random = Random();

  void deleteContact(int index) {
    manager.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: manager.length,
          itemBuilder: (context, index) {
            ContactModel item = manager[index];
            return ListTile(
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
                backgroundColor:
                    Colors.primaries[_random.nextInt(Colors.primaries.length)]
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
                            deleteContact(index);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('${item.contactName} Deleted')),
                            );
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
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add),
        onPressed: () async {
          ContactModel data = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ContactFormScreen()));
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

class ContactModel {
  final String contactName;
  final String contactNumber;

  ContactModel({
    required this.contactName,
    required this.contactNumber,
  });
}

class ContactFormScreen extends StatefulWidget {
  const ContactFormScreen({
    super.key,
  });

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _contactNameController = TextEditingController();
  // ignore: unused_field
  String _contactName = '';
  final _contactNumberController = TextEditingController();
  // ignore: unused_field
  String _contactNumber = '';

  @override
  void initState() {
    super.initState();
    _contactNameController.addListener(() {
      setState(() {
        _contactName = _contactNameController.text;
      });
    });
    _contactNumberController.addListener(() {
      setState(() {
        _contactNumber = _contactNumberController.text;
      });
    });
  }

  @override
  void dispose() {
    _contactNameController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Contact', style: GoogleFonts.poppins()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildNameField(),
            const SizedBox(
              height: 16,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _contactNameController,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: 'Input Contact Name',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _contactNumberController,
          cursorColor: Colors.black,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: const InputDecoration(
            hintText: 'Input Contact Number',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      child: Text(
        'Save',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        Navigator.of(context).pop(ContactModel(
            contactName: _contactName, contactNumber: _contactNumber));
      },
    );
  }
}
