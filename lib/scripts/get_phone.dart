import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

Future<Map<String, dynamic>> fetchPosts() async {
  final storage = GetStorage();
  String jwt = storage.read('jwt');
  Map<String, dynamic> jwtToken = jsonDecode(jwt);
  String? accessToken = jwtToken['access'];

  Map<String, dynamic>? userData = storage.read('user_data');
  final driverUsername = userData!['username'];

  try {
    final response = await http.get(
      Uri.parse(
          'http://172.105.74.117:8000/api/drivers/get/restaurant_phone/$driverUsername/'),
      headers: {
        'Authorization': 'JWT $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Map<String, dynamic> resultMap = {};
      for (var item in result) {
        resultMap[item['name']] = item['phone'];
      }
      return resultMap;
    } else {
      throw Exception('Failed to load');
    }
  } catch (error) {
    throw Exception('Failed to load');
  }
}
