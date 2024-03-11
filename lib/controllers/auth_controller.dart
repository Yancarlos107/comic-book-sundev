import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_services.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final validSession = FirebaseAuth.instance.authStateChanges();

  final _isLoading = false;
  String _errorMessage = '';

  double _height = 20.0;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  double get height => _height;

  set height(double value) {
    _height = value;
    notifyListeners();
  }

  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  bool get isError => _errorMessage.isNotEmpty;
  String get errorMessage => _errorMessage;

  Future<void> signInUser() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: userController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message!;
    } finally {
      userController.clear();
      passwordController.clear();
      notifyListeners();
    }
  }

  void signuserOut() async {
    FirebaseAuth.instance.signOut();
  }

  void loginWithGoogle() async {
    AuthService().signInWithGoogle();
  }
}
