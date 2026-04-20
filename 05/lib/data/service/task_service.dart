import 'dart:convert';

import 'package:http/http.dart' as http;

class TaskService {
  static const String _baseUrl =
      'https://69ddafcd410caa3d47b9c5ae.mockapi.io/api/v1/task';

  Future<List<Map<String, dynamic>>> fetchTasks() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((item) => item as Map<String, dynamic>).toList();
    }

    throw Exception('Failed to load tasks: ${response.statusCode}');
  }

  Future<void> deleteTask(String id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode == 200 || response.statusCode == 204) {
      return;
    }

    throw Exception('Failed to delete task: ${response.statusCode}');
  }
}

