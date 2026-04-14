import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductService {
  final String url = "https://69ddafcd410caa3d47b9c5ae.mockapi.io/api/v1/product";

  Future<Map<String, dynamic>> fetchProduct (int id) async {
      final response = await http.get(Uri.parse("$url/$id"));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load users");
      }
  }
}
