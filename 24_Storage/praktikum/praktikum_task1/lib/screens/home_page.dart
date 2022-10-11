import 'package:flutter/material.dart';
import 'package:praktikum_task1/screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_manager.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required this.user,
  });
  UserManager user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences registerdata;

  @override
  void initState() {
    super.initState();
    Initial();
  }

  // ignore: non_constant_identifier_names
  void Initial() async {
    registerdata = await SharedPreferences.getInstance();
    setState(() {
      widget.user.userName = registerdata.getString('username').toString();
      widget.user.userEmail = registerdata.getString('email').toString();
      widget.user.userNumber = registerdata.getString('number').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(builder: (context, userManager, _) {
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
              Text(widget.user.userName),
              const SizedBox(
                height: 5,
              ),
              Text(widget.user.userEmail),
              const SizedBox(
                height: 5,
              ),
              Text(widget.user.userNumber),
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
    });
  }
}
