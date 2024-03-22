import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final controller;
  final String labelText;
  final bool obscureText;
  bool showPassword;

  LoginInput({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
    this.showPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey[200],
          ),
          fillColor: const Color.fromARGB(59, 255, 255, 255),
          filled: true,
        ),
      ),
    );
  }
}
