import 'package:flutter/material.dart';
import 'package:nguyenminhvuong_api/screens/task_delete_screen.dart';

class Routes {
  static const String task = '/task';

  static Map<String, WidgetBuilder> routes = {
    task: (context) => const TaskDeleteScreen(),
  };
}