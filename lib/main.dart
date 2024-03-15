import 'package:flutter/material.dart';

// Storage
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

// My pages
import 'pages/login_page.dart';
import 'theme/theme_provider.dart';

void main() async {
  await GetStorage.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FDFMS',
      home: LoginPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
