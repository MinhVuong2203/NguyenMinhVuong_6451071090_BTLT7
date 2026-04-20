import 'package:flutter/material.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Post API',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.post,
      routes: Routes.routes,
    );
  }
}