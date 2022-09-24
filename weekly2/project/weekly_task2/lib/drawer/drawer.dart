import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Grand Hotel'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/image/Logo.png'),
            ),
            accountEmail: Text(
              'grandhotel@gmail.com',
              style: TextStyle(color: Colors.white70),
            ),
            otherAccountsPictures: [],
          ),
          DrawerListTile(
            iconData: Icons.contact_support_outlined,
            title: 'Contact Us',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.info_outlined,
            title: 'About Us',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.login_outlined,
            title: 'Login',
            onTilePressed: () {},
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
