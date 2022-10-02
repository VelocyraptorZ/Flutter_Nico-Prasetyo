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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ContactItemCard(
              contact: ContactModel(
                  contactName: "Nico Prasetyo",
                  contactNumber: "081242502342333"),
            ),
        '/ContactItemScreen': (context) => const ContactItemScreen()
      },
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

class ContactItemScreen extends StatefulWidget {
  const ContactItemScreen({super.key});

  @override
  State<ContactItemScreen> createState() => _ContactItemScreenState();
}

class _ContactItemScreenState extends State<ContactItemScreen> {
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
        'Submit',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ContactItemCard(
                contact: ContactModel(
                    contactName: _contactName,
                    contactNumber: _contactNumber))));
      },
    );
  }
}

class ContactItemCard extends StatelessWidget {
  final ContactModel contact;
  final _random = Random();

  ContactItemCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
      ),
      body: ListTile(
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
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.person_add),
                Text(
                  'push()',
                  style: TextStyle(fontSize: 5),
                )
              ],
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactItemScreen(),
              ),
            );
          },
        ),
        const SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.person_add),
                Text(
                  'pushNamed()',
                  style: TextStyle(fontSize: 5),
                )
              ],
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/ContactItemScreen',
            );
          },
        ),
      ]),
    );
  }
}
