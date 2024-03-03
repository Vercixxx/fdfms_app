import 'package:flutter/material.dart';

// NavBar
import '../pages/menu.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
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
