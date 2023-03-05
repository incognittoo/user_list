import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';

class UserProvider {
  Future<dynamic> getUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}
