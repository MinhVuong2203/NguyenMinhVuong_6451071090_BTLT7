import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nguyenminhvuong_api/data/models/info.dart';

class InfoService {
  static const String _url =
      'https://69ddafcd410caa3d47b9c5ae.mockapi.io/api/v1/info';

  Future<Map<String, dynamic>> getInfo(String id) async {
    final response = await http.get(Uri.parse('$_url/$id'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    throw Exception('Failed to load info: ${response.statusCode}');
  }

  Future<Map<String, dynamic>> updateInfo(Info info) async {
    final response = await http.put(
      Uri.parse('$_url/${info.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(info.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    throw Exception('Failed to update info: ${response.statusCode}');
  }
}

