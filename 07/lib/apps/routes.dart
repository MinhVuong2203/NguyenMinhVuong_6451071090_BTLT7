import 'package:flutter/material.dart';
import 'package:nguyenminhvuong_api/screens/news_screen.dart';

class Routes {
  static const String news = '/news';

  static Map<String, WidgetBuilder> routes = {
    news: (context) => const NewsScreen(),
  };
}