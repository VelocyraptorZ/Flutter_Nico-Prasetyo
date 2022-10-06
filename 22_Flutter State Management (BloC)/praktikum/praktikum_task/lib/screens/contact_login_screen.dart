import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    );
  }

  Widget _usernameField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: const Icon(Icons.person),
        hintText: 'Username',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: const Icon(Icons.security),
        hintText: 'Username',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Login'),
    );
  }
}
