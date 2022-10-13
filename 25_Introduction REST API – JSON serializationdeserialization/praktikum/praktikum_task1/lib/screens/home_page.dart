import 'package:flutter/material.dart';

import '../action/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final MyService _MyService = MyService();
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();
  // ignore: non_constant_identifier_names
  Map<String, dynamic> API = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value != null && value.length < 5) {
                      return 'Enter at least 5 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _jobController,
                  decoration: const InputDecoration(
                    labelText: 'Job',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value != null && value.length < 5) {
                      return 'Enter at least 5 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final data = await _MyService.GetUsers();
                        setState(() {
                          API = data;
                        });
                      },
                      child: const Text('GET'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm) {
                          final data = await _MyService.createUser(
                              name: _nameController.text,
                              job: _jobController.text);
                          setState(() {
                            API = data;
                          });
                        }
                      },
                      child: const Text('POST'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm) {
                          final data = await _MyService.updateUser(
                              name: _nameController.text,
                              job: _jobController.text);
                          setState(() {
                            API = data;
                          });
                        }
                      },
                      child: const Text('PUT'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await _MyService.deleteUser();
                        setState(() {
                          API.clear();
                        });
                      },
                      child: const Text('DELETE'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text('Result'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text(
                      '$API',
                      textAlign: TextAlign.justify,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
