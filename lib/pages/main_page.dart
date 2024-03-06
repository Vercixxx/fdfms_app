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
          backgroundColor: Colors.grey.shade100,
          color: Color.fromARGB(97, 3, 0, 7),
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
        backgroundColor: Colors.grey.shade100,
        title: Text(
          _page == 0 ? 'Home' : 'Delivery',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: (_page == 0)
              ? FdfmsHome()
              : (_page == 1)
                  ? DeliveryHome()
                  : Container(), // default case if _page is not 0 or 1
        ),
      ),
    );
  }
}
