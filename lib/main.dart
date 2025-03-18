import 'package:flutter/material.dart';
import 'package:web_farmagro/features/views/views.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmagro',
      home: AppLayout(content: HomeView()), // Página inicial
      routes: {
        '/home': (context) => AppLayout(content: HomeView()),
        '/contact': (context) => AppLayout(content: ContactView()),
        '/about': (context) => AppLayout(content: AboutView()),
      },
    );
  }
}
