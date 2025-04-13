import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_farmagro/core/router.dart';
import 'package:web_farmagro/firebase_options.dart';

import 'services/provider/configuration_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConfigProvider()..cargarCategorias()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Agrimarket',
        routerConfig: appRouter,
      ),
    );
  }
}
