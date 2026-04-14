import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  final String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<dynamic>> fetchUser () async {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load users");
      }
  }
}
