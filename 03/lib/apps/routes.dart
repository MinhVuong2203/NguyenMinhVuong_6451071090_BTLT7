import 'package:flutter/material.dart';
import 'package:nguyenminhvuong_api/screens/post_create_screen.dart';

class Routes {
  static const String post = '/posts';

  static Map<String, WidgetBuilder> routes = {
    post: (context) => const PostCreateScreen(),

  };
}