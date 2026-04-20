import 'package:flutter/material.dart';
import 'package:nguyenminhvuong_api/screens/product_search_screen.dart';

class Routes {
  static const String product = '/products-search';

  static Map<String, WidgetBuilder> routes = {
    product: (context) => const ProductSearchScreen(),
  };
}