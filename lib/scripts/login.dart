import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';

Future<dynamic> login_func(String username, String password) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/v1/login/'),
    // Uri.parse('http://10.0.2.2:8000/api/v1/login/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  final storage = GetStorage();

  final responseBody = jsonDecode(response.body);

  // define response, so I can send it in return
  var myResponse = {
    'status': false,
    'message': 'Error',
  };

  if (response.statusCode == 200 && responseBody['user_role'] == 'Driver') {
    final jwt = responseBody['jwt'];

    storage.write('user_data', responseBody['data']);

    TokenManager.saveTokens(jwt['access'], jwt['refresh']);
    myResponse['status'] = true;
    return myResponse;
  } else {
    String error = responseBody['error'];
    myResponse['status'] = false;
    myResponse['message'] = error;
    return myResponse;
  }
}

class TokenManager {
  static Future<void> saveTokens(
      String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refreshToken');
  }

  // static Future<Map<String, String>> getHeaders() async {
  //   final accessToken = await getAccessToken();
  //   return {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization': 'Bearer $accessToken',
  //   };
  // }
}
