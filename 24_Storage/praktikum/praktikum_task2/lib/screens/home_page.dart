import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_task2/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/user_bloc.dart';
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
  Widget build(BuildContext context) {
    final userManager = BlocProvider.of<UserBloc>(context);
    userManager.add(Initial());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserRegister) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Welcome'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(state.username),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(state.email),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(state.number),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      userManager.add(
                        AddRegister(
                          userModel: UserModel(
                              newUser: true,
                              username: username,
                              email: email,
                              number: number),
                        ),
                      );
                      userManager.add(RemoveRegister());
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text('Sign Out'),
                  )
                ],
              );
            }
            return const Text('Error');
          },
        ),
      ),
    );
  }
}
