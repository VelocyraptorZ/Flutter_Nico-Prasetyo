import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_screen.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences registerdata;
  String username = '';
  String email = '';
  String number = '';

  @override
  void initState() {
    super.initState();
    Initial();
  }

  // ignore: non_constant_identifier_names
  void Initial() async {
    registerdata = await SharedPreferences.getInstance();
    setState(() {
      username = registerdata.getString('username').toString();
      email = registerdata.getString('email').toString();
      number = registerdata.getString('number').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome'),
            const SizedBox(
              height: 5,
            ),
            Text(username),
            const SizedBox(
              height: 5,
            ),
            Text(email),
            const SizedBox(
              height: 5,
            ),
            Text(number),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  registerdata.setBool('register', true);
                  registerdata.remove('username');
                  registerdata.remove('email');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: const Text('Log Out'))
          ],
        ),
      ),
    );
  }
}
