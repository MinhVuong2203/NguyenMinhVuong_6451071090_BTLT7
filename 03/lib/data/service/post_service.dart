import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nguyenminhvuong_api/data/models/post.dart';

class PostService {
  static const String _url =
      'https://69ddafcd410caa3d47b9c5ae.mockapi.io/api/v1/posts';

  Future<Map<String, dynamic>> createPost(Post post) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    throw Exception('Failed to create post: ${response.statusCode}');
  }
}
