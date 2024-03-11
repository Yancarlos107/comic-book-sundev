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

  void signUserUp() async {
    /* showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator())); */

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await _auth.createUserWithEmailAndPassword(
            email: userController.text, password: passwordController.text);
        /* Navigator.pop(context); */
      } else {
        /*  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Passwords do not match'),
          duration: Duration(seconds: 5),
        )); */
      }
      /* Navigator.pop(context); */
    } on FirebaseAuthException catch (e) {
      print(e.message);
      /* Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message!),
        duration: const Duration(seconds: 5),
      )); */
    }
  }
}
