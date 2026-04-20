import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  static const String baseUrl =
      "https://69ddafcd410caa3d47b9c5ae.mockapi.io/api/v1/news";

  Future<List<Map<String, dynamic>>> fetchNews() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.cast<Map<String, dynamic>>();
    }

    throw Exception("Failed to load news");
  }
}