import 'package:comic_book/firebase_options.dart';
import 'package:comic_book/pages/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/controllers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(
          create: (context) => DataIssuesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DataDetailIssueProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Comic Book App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/initial': (context) => const InitialPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
          '/detail': (context) => const DetailIssuePage(),
        },
        home: const AuthPage(),
      ),
    );
  }
}
