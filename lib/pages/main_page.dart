import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// BottomMenu
import '../components/bottom_menu.dart';

// NavBar
import '../pages/menu.dart';

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
          backgroundColor: Colors.deepPurple,
          color: Colors.deepPurple.shade200,
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
                Icons.restaurant,
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
        backgroundColor: Colors.deepPurple.shade200,
        title: const Text(
          'FDFMS',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),

      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: Text(
            _page.toString(),
            style: const TextStyle(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
