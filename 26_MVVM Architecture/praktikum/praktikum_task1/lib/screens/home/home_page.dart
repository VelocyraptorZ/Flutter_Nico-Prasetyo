import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  // final MyService _MyService = MyService();
  final _nameController = TextEditingController();
  final _programController = TextEditingController();
  // ignore: non_constant_identifier_names
  Map<String, dynamic> API = {};

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
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
                  controller: _programController,
                  decoration: const InputDecoration(
                    labelText: 'Program',
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
                      onPressed: () {
                        Provider.of<HomeViewModel>(context, listen: false)
                            .getData();
                      },
                      child: const Text('GET'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Provider.of<HomeViewModel>(context, listen: false)
                            .createUser(
                          _nameController.text,
                          _programController.text,
                        );
                      },
                      child: const Text('POST'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Provider.of<HomeViewModel>(context, listen: false)
                            .updateUser(
                          _nameController.text,
                          _programController.text,
                        );
                      },
                      child: const Text('PUT'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Provider.of<HomeViewModel>(context, listen: false)
                            .deleteUser();
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
                      homeViewModel.data.toString(),
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
