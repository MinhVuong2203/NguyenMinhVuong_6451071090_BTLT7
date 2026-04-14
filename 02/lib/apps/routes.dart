import 'package:flutter/material.dart';
import 'package:nguyenminhvuong_api/screens/product_details_screens.dart';


class Routes {
  static const String user = '/users';

  static Map<String, WidgetBuilder> routes = {
    user: (context) => ProductDetailScreen(),
  };
}