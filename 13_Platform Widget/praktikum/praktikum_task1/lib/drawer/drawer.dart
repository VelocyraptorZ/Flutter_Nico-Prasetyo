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
            accountName: Text('Vladimir Putin'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/Putin.png'),
            ),
            accountEmail: Text(
              'russiananthem@gmail.com',
              style: TextStyle(color: Colors.white70),
            ),
            otherAccountsPictures: [],
          ),
          DrawerListTile(
            iconData: Icons.group,
            title: 'New Group',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.person_outline,
            title: 'Contacts',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.phone,
            title: 'Calls',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.place_outlined,
            title: 'People Nearby',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.bookmark_border,
            title: 'Saved Messages',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.settings,
            title: 'Settings',
            onTilePressed: () {},
          ),
          const Divider(),
          DrawerListTile(
            iconData: Icons.person_add,
            title: 'Invite Friends',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.help_outline,
            title: 'Telegram FAQ',
            onTilePressed: () {},
          )
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
