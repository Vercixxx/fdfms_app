import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDialog extends StatelessWidget {
  final String title;
  final String context;
  final String leftButton;
  final String rightButton;
  final VoidCallback leftButtonFunction;
  final VoidCallback rightButtonFunction;

  const MyDialog({
    required this.title,
    required this.context,
    required this.leftButton,
    required this.rightButton,
    required this.leftButtonFunction,
    required this.rightButtonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade400,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(children: [
            const Expanded(
              child: Icon(
                Icons.warning,
                color: Colors.yellow,
              ),
            ),
            Center(
              child: Text(
                this.title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(
              child: Icon(
                Icons.warning,
                color: Colors.yellow,
              ),
            ),
          ]),
        ),
        Row(
          children: [
            Text(
              this.context,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 120,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    leftButtonFunction();
                  },
                  child: Text(leftButton, style: TextStyle(fontSize: 16)),
                ),
              ),
              Container(
                width: 120,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    rightButtonFunction();
                  },
                  child: Text(rightButton, style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
