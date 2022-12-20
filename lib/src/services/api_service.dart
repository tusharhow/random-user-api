import 'package:dio/dio.dart';
import 'package:fetch_random_user_api/src/constants/api_constants.dart';
import 'package:fetch_random_user_api/src/models/user.dart';

class RemoteServices {
  static var dio = Dio();

  static Future<List<Results>> fetchUsers() async {
    var response = await dio.get("${ApiConstants.BASE_URL}?results=100");
    if (response.statusCode == 200) {
      var result = response.data;
      List<Results> users = [];
      for (var json in result['results']) {
        users.add(Results.fromJson(json));
      }
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
