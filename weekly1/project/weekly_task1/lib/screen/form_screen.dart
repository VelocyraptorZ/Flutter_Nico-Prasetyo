import 'package:flutter/material.dart';

class FormSheet extends StatefulWidget {
  const FormSheet({Key? key}) : super(key: key);

  @override
  State<FormSheet> createState() => _FormSheetState();
}

class _FormSheetState extends State<FormSheet> {
  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  TextEditingController FirstName = TextEditingController();
  String firstName = '';
  // ignore: non_constant_identifier_names
  TextEditingController LastName = TextEditingController();
  String lastName = '';
  // ignore: non_constant_identifier_names
  TextEditingController Email = TextEditingController();
  String email = '';
  // ignore: non_constant_identifier_names
  TextEditingController Problem = TextEditingController();
  String problem = '';

  void setText() {
    setState(() {
      firstName = FirstName.text;
      lastName = LastName.text;
      email = Email.text;
      problem = Problem.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Reservation')),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: SizedBox(
                      child: Text('First Name'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Text('Last Name'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: FirstName,
                            decoration: InputDecoration(
                              hintText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama Depan tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 30,
                          child: TextFormField(
                            controller: LastName,
                            decoration: InputDecoration(
                              hintText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama Belakang tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: SizedBox(
                      child: Text('Email'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: Email,
                            decoration: InputDecoration(
                              hintText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: SizedBox(
                      child: Text('What can we help you?'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: Problem,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Isi tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                width: 100,
                child: ElevatedButton(
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setText();
                      showDialog<String>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Your Data'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Name : $firstName $lastName'),
                              Text('Email : $email'),
                              Text('Your Problem : $problem'),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                      FirstName.clear();
                      LastName.clear();
                      Email.clear();
                      Problem.clear();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
