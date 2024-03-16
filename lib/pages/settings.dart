import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/switch.dart';
import '../theme/theme_provider.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.contrast,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Theme',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: SwitchComponent(
                    iconOn: const Icon(
                      Icons.nightlight_round,
                      color: Colors.white,
                    ),
                    iconOff: const Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                    ),
                    actionOn: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .setDarkMode(true);
                    },
                    actionOff: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .setDarkMode(false);
                    },
                  ),
                ),
              ),
            ],
          ),
          // Darkmode

          const SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.language,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Language',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: DropdownButton(
                    focusColor: Theme.of(context).colorScheme.background,
                    underline: Container(),
                    value: selectedLanguage,
                    borderRadius: BorderRadius.circular(10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 1),
                    alignment: Alignment.center,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'English',
                        alignment: Alignment.center,
                        child: Text('English'),
                      ),
                      DropdownMenuItem(
                        value: 'Polish',
                        alignment: Alignment.center,
                        child: Text('Polish'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            height: 50,
            thickness: 1,
          ),
        ]),
      ),
    );
  }
}
