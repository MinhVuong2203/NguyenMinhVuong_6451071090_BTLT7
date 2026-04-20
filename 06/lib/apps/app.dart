import 'package:flutter/material.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Products Search API',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.product,
      routes: Routes.routes,
    );
  }
}