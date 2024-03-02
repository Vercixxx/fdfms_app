import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../pages/main_page.dart';

Future<String> login_func(String username, String password) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/log-in/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  // Print the response body
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    final jwt = responseBody['jwt'];

    print('JWT: $jwt');
    // TokenManager.saveTokens(jwt['access'], jwt['refresh']);
    return jwt;
  } else {
    throw Exception('Error! Failed to login.');
  }
}

class TokenManager {
  static String? accessToken;
  static String? refreshToken;

  static void saveTokens(String accessToken, String refreshToken) {
    TokenManager.accessToken = accessToken;
    TokenManager.refreshToken = refreshToken;
  }

  static Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${TokenManager.accessToken}',
    };
  }
}
