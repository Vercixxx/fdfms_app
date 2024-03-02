import 'package:flutter/material.dart';

// My pages
import 'pages/login_page.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FDFMS',
      home: LoginPage(),
    );
  }
}
