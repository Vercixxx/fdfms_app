import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// BottomMenu
import '../components/bottom_menu.dart';

// NavBar
import '../pages/menu.dart';

// Pages
import '../pages/fdfms_home.dart';
import '../pages/delivery_home.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Initialize storage
  final storage = GetStorage();

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),

      // Bottom menu
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          color: Color.fromARGB(255, 12, 136, 95),
          animationDuration: const Duration(milliseconds: 200),
          height: 60,
          items: const [
            CurvedNavigationBarItem(
              child: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.local_shipping,
                color: Colors.white,
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          }),
      // Bottom menu

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          _page == 0 ? 'Home' : 'Delivery',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
        child: Center(
          child: (_page == 0)
              ? FdfmsHome()
              : (_page == 1)
                  ? DeliveryHome()
                  : Container(),
        ),
      ),
    );
  }
}
