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
  // ignore: non_constant_identifier_names
  TextEditingController LastName = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController Email = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController Problem = TextEditingController();

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
                                return 'Nama tidak boleh kosong';
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
                                return 'Nama tidak boleh kosong';
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
                                return 'Nama tidak boleh kosong';
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
                                return 'Nama tidak boleh kosong';
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
                      showDialog<String>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Your Data'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Name : ${FirstName.text} ${LastName.text}'),
                              Text('Email : ${Email.text}'),
                              Text('Your Problem : ${Problem.text}'),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            )
                          ],
                        ),
                      );
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
