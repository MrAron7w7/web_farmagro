import 'package:flutter/material.dart';
import 'package:web_farmagro/core/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Agrimarket',
      routerConfig: appRouter,
    );
  }
}
