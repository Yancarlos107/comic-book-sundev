import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _height = 20.0;

  TextEditingController get userController => _userController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  double get height => _height;

  final _isLoading = false;
  String _errorMessage = '';

  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  bool get isError => _errorMessage.isNotEmpty;
  String get errorMessage => _errorMessage;
  bool get isPasswordMatch =>
      _passwordController.text == _confirmPasswordController.text;

  Future signUserUp() async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await _auth.createUserWithEmailAndPassword(
            email: userController.text, password: passwordController.text);
      } else {
        errorMessage = 'Password does not match';
      }
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message!;
      throw Exception(e.message);
    } finally {
      userController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      notifyListeners();
    }
  }
}
