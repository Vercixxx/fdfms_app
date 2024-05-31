import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../scripts/get_phone.dart';

class CallCenterPage extends StatelessWidget {
  void _launchURL(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Center'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchPosts(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView(
              children: snapshot.data!.entries.map((entry) {
                return ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('${entry.key}'),
                  subtitle: Text('${entry.value}'),
                  onTap: () => _launchURL(entry.value),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
