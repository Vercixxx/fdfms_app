import 'package:flutter/material.dart';

class DeliveryHome extends StatelessWidget {
  const DeliveryHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.delivery_dining,
                      color: Colors.blue
                          .withOpacity(0.2), // make it semi-transparent
                      size: 100.0, // adjust size as needed
                    ),
                    const Text(
                      'Your orders will appear here',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
