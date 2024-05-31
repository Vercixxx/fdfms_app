import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About us'),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/fdfms.png',
                  width: 300,
                ),
              ),
            ),
            Text(
              'Food Delivery Fleet Management System App (FDFMS) is an innovative application for food delivery drivers, enabling easy route management, customer communication, and efficient shift planning. Our app provides quick access to important organizational information for drivers and improves customer experience through fast and reliable service. Join us today and experience the revolution in fleet management!',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              '${DateTime.now().year} FDFMS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
