import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// My pages
import '../pages/login_page.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? userData = storage.read('user_data');
    String first_name =
        userData != null ? userData['first_name'] : 'Default Name';
    String last_name =
        userData != null ? userData['last_name'] : 'Default Last name';

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(first_name), accountEmail: Text(last_name)),

          // Home
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () => print('Home'),
          ),
          // Home

          // Phone center
          ListTile(
            title: const Text('Call center'),
            leading: const Icon(Icons.phone),
            onTap: () => print('Call center'),
          ),
          // Phone center

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
