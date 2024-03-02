import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:fdfms_app/components/login_input.dart';
import 'package:fdfms_app/components/login_button.dart';

import 'package:fdfms_app/scripts/login.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Inputs controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 199, 89, 135),
          Color.fromARGB(223, 87, 71, 143),
          Color.fromARGB(255, 90, 124, 62),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(MdiIcons.carPickup, color: Colors.white, size: 70),

              // Logo
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Food Delivery Fleet Management System',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  )),

              const SizedBox(height: 20),

              // Username
              LoginInput(
                controller: usernameController,
                labelText: 'Username',
                obscureText: false,
              ),
              // Username

              const SizedBox(height: 5),

              // Forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                  ),
                ),
              ),

              // Password
              LoginInput(
                controller: passwordController,
                labelText: 'Password',
                obscureText: true,
              ),
              // Password

              const SizedBox(height: 50),

              // Button login
              LoginButton(
                onTap: () {
                  login_func(
                    usernameController.text,
                    passwordController.text,
                  );
                },
              ),
              // Button login
            ],
          ),
        ),
      ),
    );
  }
}
