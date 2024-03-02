import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;

  const LoginButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 218, 130, 16),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
