import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

Future<dynamic> login_func(String username, String password) async {
  var myResponse = {
    'status': false,
    'message': 'Error',
  };

  try {
    final response = await http.post(
      Uri.parse('http://172.105.74.117:8000/api/v1/login/'),
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

    if (response.statusCode == 200 && responseBody['user_role'] == 'Driver') {
      storage.write('user_data', responseBody['data']);
      storage.write('jwt', jsonEncode(responseBody['jwt']));

      myResponse['status'] = true;
      return myResponse;
    } else {
      String error = responseBody['error'];
      myResponse['status'] = false;
      myResponse['message'] = error;
      return myResponse;
    }
  } catch (error) {
    myResponse['status'] = false;
    myResponse['message'] = 'Error, please try again';
    return myResponse;
  }
}
