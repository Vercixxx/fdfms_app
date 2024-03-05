import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// Alert
import '../components/alert.dart';

// My pages
import '../pages/login_page.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  final storage = GetStorage();

  void showMyDialog(
      BuildContext context,
      String title,
      String dialogContext,
      String leftButton,
      String rightButton,
      VoidCallback? leftButtonFunction,
      VoidCallback? rightButtonFunction) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialog(
          title: title,
          context: dialogContext,
          leftButton: leftButton,
          rightButton: rightButton,
          leftButtonFunction: leftButtonFunction!,
          rightButtonFunction: rightButtonFunction!,
        );
      },
    );
  }

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
                showMyDialog(
                  context,
                  'Logout',
                  'Are you sure?',
                  'No',
                  'Yes',
                  () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  // Navigator.pop(context);
                );
              }),
          // Logout
        ],
      ),
    );
  }
}
