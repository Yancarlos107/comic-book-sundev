import 'package:comic_book/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comic Book App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/initial': (context) => const InitialPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
      home: const InitialPage(),
    );
  }
}
