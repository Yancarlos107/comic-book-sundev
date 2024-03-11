import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_services.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final validSession = FirebaseAuth.instance.authStateChanges();

  double _height = 20.0;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  double get height => _height;

  set height(double value) {
    _height = value;
    notifyListeners();
  }

  Future<void> signInUser() async {
    /* showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    ); */

    try {
      await _auth.signInWithEmailAndPassword(
          email: userController.text, password: passwordController.text);
      /* Navigator.pop(context); */
    } on FirebaseAuthException catch (e) {
      /* Navigator.pop(context); */
      print(e.message);
      /*  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message!),
        duration: const Duration(seconds: 5),
      )); */
    }
    userController.clear();
    passwordController.clear();
    notifyListeners();
  }

  void signuserOut() async {
    FirebaseAuth.instance.signOut();
  }

  void loginWithGoogle() async {
    AuthService().signInWithGoogle();
  }
}
