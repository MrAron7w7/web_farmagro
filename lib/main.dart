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
        '/store': (context) => AppLayout(content: StoreView()),
        '/about': (context) => AppLayout(content: AboutView()),
        '/activities': (context) => AppLayout(content: ActivitiesView()),
        '/products': (context) => AppLayout(content: ProductsView()),
        '/branches': (context) => AppLayout(content: BranchesView()),
        '/contact': (context) => AppLayout(content: ContactView()),
      },
    );
  }
}
