import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final Function()? onTap;
  final ValueNotifier<bool> isLoading;

  LoginButton({
    Key? key,
    required this.onTap,
    required this.isLoading,
  }) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.isLoading,
      builder: (context, isLoading, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isLoading ? 50 : null,
          height: isLoading ? 50 : null,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ElevatedButton(
                onPressed: widget.onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(0, 4, 0, 250),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  textStyle: const TextStyle(fontSize: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: isLoading
                    ? Container()
                    : const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
              ),
              if (isLoading)
                const CircularProgressIndicator(
                  color: Colors.green,
                ),
            ],
          ),
        );
      },
    );
  }
}
