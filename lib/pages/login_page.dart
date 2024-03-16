import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get_storage/get_storage.dart';

// Components
import 'package:animated_snack_bar/animated_snack_bar.dart';

import 'package:fdfms_app/components/login_input.dart';
import 'package:fdfms_app/components/login_button.dart';
import 'package:fdfms_app/components/remember_me.dart';

import 'package:fdfms_app/scripts/login.dart';

import 'main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Checkbox value
  bool isRememberMeChecked = false;

  // Initialize storage
  final storage = GetStorage();
  String? username;
  String? password;

  // Inputs controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Login button loading state
  final isLoading = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    // Get values from storage
    String? username = storage.read('username');
    String? password = storage.read('password');

    // Initialize text controllers with the values from storage
    isRememberMeChecked = storage.read('isRememberMeChecked') ?? false;
    usernameController.text = username ?? '';
    passwordController.text = password ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 12, 136, 95),
          Color.fromARGB(113, 255, 255, 255),
          Color.fromARGB(144, 250, 0, 217),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/images/fdfms.png',
                  width: 140,
                  height: 140,
                ),
              ),

              // Logo
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Food Delivery Fleet Management System',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  )),

              const SizedBox(height: 20),

              // Username
              LoginInput(
                controller: usernameController,
                labelText: 'Username',
                obscureText: false,
              ),
              // Username

              const SizedBox(height: 5),

              // Forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                  ),
                ),
              ),

              // Password
              LoginInput(
                controller: passwordController,
                labelText: 'Password',
                obscureText: true,
              ),
              // Password

              // Remember me
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Remember me',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 5),
                  RememberMeCheckbox(
                    onChanged: (bool isChecked) {
                      setState(() {
                        isRememberMeChecked = isChecked;
                      });
                    },
                    initialValue: isRememberMeChecked,
                  ),
                ],
              ),
              // Remember me

              const SizedBox(height: 50),

              // Button login
              LoginButton(
                onTap: () async {
                  isLoading.value = true;

                  dynamic loginSuccessData = await login_func(
                    usernameController.text,
                    passwordController.text,
                  );

                  bool loginSuccess = loginSuccessData['status'] ?? false;
                  String loginMessage = loginSuccessData['message'] ?? '';

                  if (loginSuccess) {
                    if (isRememberMeChecked) {
                      // Save the username and password and checkbox state
                      storage.write('isRememberMeChecked', true);
                      storage.write('username', usernameController.text);
                      storage.write('password', passwordController.text);
                      // Save the username and password and checkbox state
                    } else {
                      // Remove the username and password
                      storage.remove('isRememberMeChecked');
                      storage.remove('username');
                      storage.remove('password');
                      // Remove the username and password
                    }

                    isLoading.value = false;

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  } else {
                    AnimatedSnackBar(
                      builder: ((context) {
                        return MaterialAnimatedSnackBar(
                          titleText: 'Error ',
                          messageText: loginMessage,
                          type: AnimatedSnackBarType.error,
                          foregroundColor: Colors.amber,
                          titleTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      }),
                    ).show(context);
                    isLoading.value = false;
                  }
                },
                isLoading: isLoading,
              ),
              // Button login

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    Text(
                      'FDFMS, 2024 - Krzysztof Służałek',
                      style: TextStyle(
                        color: Color.fromARGB(204, 255, 255, 255),
                        fontSize: 13,
                      ),
                    ),
                  ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
