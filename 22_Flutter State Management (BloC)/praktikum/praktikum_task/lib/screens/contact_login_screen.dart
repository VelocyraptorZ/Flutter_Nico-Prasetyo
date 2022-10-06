import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Contact Login',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              _usernameField(),
              const SizedBox(
                height: 10,
              ),
              _passwordField(),
              const SizedBox(
                height: 10,
              ),
              _loginButton(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: const Icon(Icons.person),
        hintText: 'Username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Username Cannot Be Empty';
        }
        return null;
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: const Icon(Icons.security),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password Cannot Be Empty';
        }
        return null;
      },
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
      },
      child: const Text('Login'),
    );
  }
}
