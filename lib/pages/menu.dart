import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// LogoutDialog
import '../components/logout_dialog.dart';

// My pages
import '../pages/login_page.dart';
import '../pages/settings.dart';
import '../pages/scheduler.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  final storage = GetStorage();

  void invokeLogoutDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? userData = storage.read('user_data');
    String firstName =
        userData != null ? userData['first_name'] : 'Default Name';
    String lastName =
        userData != null ? userData['last_name'] : 'Default Last name';
    String email = userData != null ? userData['email'] : 'Default email';

    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 12, 136, 95),
              ),
              accountName: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(firstName),
                  Text(lastName),
                ],
              ),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                child: Image.asset(
                  'assets/images/fdfms.png',
                ),
              ),
            ),

            // Home
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () => print('Home'),
            ),
            // Home

            // Scheduler
            ListTile(
              title: const Text('Scheduler'),
              leading: const Icon(Icons.calendar_month_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scheduler()),
                );
              },
            ),
            // Scheduler

            // Phone center
            ListTile(
              title: const Text('Call center'),
              leading: const Icon(Icons.phone),
              onTap: () => print('Call center'),
            ),
            // Phone center

            const Divider(),

            // Settings
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            // Settings

            // About
            ListTile(
              title: const Text('About us'),
              leading: const Icon(Icons.info),
              onTap: () => print('About us'),
            ),
            // Rate

            // Rate
            ListTile(
              title: const Text('Rate us'),
              leading: const Icon(Icons.star),
              onTap: () => print('Rate'),
            ),
            // Rate

            const Divider(),

            // Logout
            ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.logout),
                onTap: () {
                  invokeLogoutDialog(context);
                }),
            // Logout
          ],
        ),
      ),
    );
  }
}
