import 'package:flutter/material.dart';
import 'package:nguyenminhvuong_api/screens/info_update_screen.dart';

class Routes {
  static const String info = '/info';

  static Map<String, WidgetBuilder> routes = {
    info: (context) => const InfoUpdateScreen(),

  };
}