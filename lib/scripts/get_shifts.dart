import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

Future<dynamic> fetchDriverShifts(List<DateTime> dates) async {
  String startDate = dates[0].toUtc().toIso8601String();
  String endDate = dates[1].toUtc().toIso8601String();

  try {
    final storage = GetStorage();
    String jwt = storage.read('jwt');
    Map<String, dynamic> jwtToken = jsonDecode(jwt);
    String? accessToken = jwtToken['access'];

    Map<String, dynamic>? userData = storage.read('user_data');
    final driverUsername = userData!['username'];

    final response = await http.get(
      Uri.http('127.0.0.1:8000', 'api/restaurant/driver-shifts/', {
        'restaurant': 'all',
        'date[start]': startDate,
        'date[end]': endDate,
        'driver': driverUsername,
      }),
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
