import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slide_to_act/slide_to_act.dart';

// My pages
import '../pages/login_page.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      backgroundColor: Colors.grey.shade400,
      actions: <Widget>[
        SlideAction(
          onSubmit: () async {
            _onDismissed(context);
          },
          text: 'Slide to logout',
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
          innerColor: Colors.grey.shade200,
          outerColor: Colors.green,
          sliderButtonIcon: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
          sliderRotate: false,
        ),
      ],
    );
  }
}

void _onDismissed(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}
