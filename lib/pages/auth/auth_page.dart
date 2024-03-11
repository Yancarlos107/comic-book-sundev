import 'package:flutter/material.dart';
import '../../controllers/controllers.dart';
import '../pages.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: authProvider.validSession,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return const HomePage();
              }
              return const InitialPage();
            }));
  }
}
