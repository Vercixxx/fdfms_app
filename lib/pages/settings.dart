import 'package:flutter/material.dart';

import '../components/switch.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedLanguage = 'English';
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          // Darkmode
          Row(
            children: [
              const Icon(
                Icons.dark_mode,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Dark mode',
                style: TextStyle(fontSize: 20),
              ),
              SwitchComponent(
                iconOn: const Icon(
                  Icons.nightlight_round,
                  color: Colors.white,
                ),
                iconOff: const Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
                actionOn: () {},
                actionOff: () {},
              ),
            ],
          ),
          // Darkmode
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Icon(
                Icons.language,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              DropdownButton(
                  value: selectedLanguage,
                  borderRadius: BorderRadius.circular(10),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'English',
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: 'Polish',
                      child: Text('Polish'),
                    ),
                  ]),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: 50,
            thickness: 1,
          ),
        ]),
      ),
    );
  }
}
