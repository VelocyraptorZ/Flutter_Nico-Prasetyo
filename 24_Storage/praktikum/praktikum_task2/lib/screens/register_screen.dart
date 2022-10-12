import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_task2/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/user_bloc.dart';
import 'home_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  late SharedPreferences registerdata;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkRegister();
  }

  void checkRegister() async {
    registerdata = await SharedPreferences.getInstance();
    newUser = registerdata.getBool('register') ?? true;

    if (newUser == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userManager = BlocProvider.of<UserBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
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
                    prefixIcon: Icon(Icons.account_circle_rounded),
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value != null && value.length < 4) {
                      return 'Enter at least 4 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (email) {
                    if (email != null && !EmailValidator.validate(email)) {
                      return 'Enter a valid email';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _numberController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value != null && value.length < 8) {
                      return 'Enter correct phone number';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password_rounded),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value != null && value.length < 5) {
                      return 'Enter min. 5 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    final isValidForm = formKey.currentState!.validate();
                    String username = _nameController.text;
                    String email = _emailController.text;
                    String number = _numberController.text;

                    if (isValidForm) {
                      userManager.add(
                        AddRegister(
                          userModel: UserModel(
                              newUser: false,
                              username: username,
                              email: email,
                              number: number),
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ));
  }
}
