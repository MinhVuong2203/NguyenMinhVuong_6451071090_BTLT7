import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductService {
  static const String _baseUrl =
      'https://69ddafcd410caa3d47b9c5ae.mockapi.io/api/v1/products';

  Future<List<Map<String, dynamic>>> searchProducts(String keyword) async {
    final uri = Uri.parse(_baseUrl).replace(
      queryParameters: {'q': keyword.trim()},
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body) as List<dynamic>;
      return decoded.map((item) => item as Map<String, dynamic>).toList();
    }

    throw Exception('Search failed: ${response.statusCode}');
  }
}

