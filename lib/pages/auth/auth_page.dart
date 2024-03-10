import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (_, snapshot) {
              print('stream');
              if (snapshot.hasData) {
                print('hasData');
                return const HomePage();
              }
              return const InitialPage();
            }));
  }
}
