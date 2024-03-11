import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/oauth_google_services.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final validSession = FirebaseAuth.instance.authStateChanges();

  bool _isLoading = false;
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

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  bool get isError => _errorMessage.isNotEmpty;
  String get errorMessage => _errorMessage;

  Future<void> signIn() async {
    isLoading = true;
    try {
      await _auth.signInWithEmailAndPassword(
          email: userController.text, password: passwordController.text);
      errorMessage = 'Login successful';
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message!;
      throw Exception(e.message);
    } finally {
      isLoading = false;
      userController.clear();
      passwordController.clear();
      notifyListeners();
    }
  }

  void signOut() async {
    FirebaseAuth.instance.signOut();
  }

  void loginWithGoogle() async {
    OAuthGoogleService().signIn();
  }
}
