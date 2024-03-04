import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// BottomMenu
import '../components/bottom_menu.dart';

// NavBar
import '../pages/menu.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  // Initialize storage
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      bottomNavigationBar: BottomMenu(),
      appBar: AppBar(
        title: const Text('FDFMS'),
        backgroundColor: const Color.fromARGB(255, 90, 124, 62),
      ),
      body: const Center(
        child: Text('Main Page'),
      ),
    );
  }
}
