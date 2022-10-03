import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import '../models/contact_model.dart';

class ContactItemScreen extends StatefulWidget {
  final Function(ContactModel) onCreate;
  const ContactItemScreen({super.key, required this.onCreate});

  @override
  State<ContactItemScreen> createState() => _ContactItemScreenState();
}

class _ContactItemScreenState extends State<ContactItemScreen> {
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
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
        TextFormField(
          controller: _contactNameController,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Input Contact Name',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Contact Name Cannot Be Empty';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _contactNumberController,
          cursorColor: Colors.black,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            hintText: 'Input Contact Number',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Contact Number Cannot Be Empty';
            }
            return null;
          },
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
        if (_formKey.currentState!.validate()) {
          final contactItem = ContactModel(
            id: const Uuid().v1(),
            contactName: _contactNameController.text,
            contactNumber: _contactNumberController.text,
          );
          widget.onCreate(contactItem);
        }
      },
    );
  }
}
