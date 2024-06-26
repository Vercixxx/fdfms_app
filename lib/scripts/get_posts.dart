import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

Future<List<dynamic>> fetchPosts() async {
  final storage = GetStorage();
  String jwt = storage.read('jwt');
  Map<String, dynamic> jwtToken = jsonDecode(jwt);
  String? accessToken = jwtToken['access'];

  try {
    final response = await http.get(
      Uri.parse('http://172.105.74.117:8000/api/app/posts/get/drivers/'),
      headers: {
        'Authorization': 'JWT $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception('Failed to load posts');
    }
  } catch (error) {
    throw Exception('Failed to load posts');
  }
}
