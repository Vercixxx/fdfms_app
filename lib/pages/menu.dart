import 'package:flutter/material.dart';

// My pages
import '../pages/login_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('asd'), accountEmail: Text('bbb')),

          // Home
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () => print('Home'),
          ),
          // Home

          Divider(),

          // Logout
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          // Logout
        ],
      ),
    );
  }
}
