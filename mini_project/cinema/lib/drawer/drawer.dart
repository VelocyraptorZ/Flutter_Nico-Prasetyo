// ignore_for_file: must_be_immutable, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  late SharedPreferences logindata;
  String username = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    Initial();
  }

  // ignore: non_constant_identifier_names
  void Initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username').toString();
      email = logindata.getString('email').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(username),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Logo.png'),
            ),
            accountEmail: Text(
              email,
              style: const TextStyle(color: Colors.white70),
            ),
            otherAccountsPictures: const [],
          ),
          DrawerListTile(
            iconData: Icons.video_collection,
            title: 'Movie',
            onTilePressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          DrawerListTile(
            iconData: Icons.contact_support_outlined,
            title: 'Contact Us',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.info_outlined,
            title: 'About Us',
            onTilePressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const AboutUs(),
              //   ),
              // );
            },
          ),
          const SizedBox(
            height: 400,
          ),
          DrawerListTile(
            iconData: Icons.login_outlined,
            title: 'Log Out',
            onTilePressed: () {
              logindata.setBool('login', true);
              logindata.remove('username');
              logindata.remove('email');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTilePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
