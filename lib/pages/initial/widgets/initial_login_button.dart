import 'package:flutter/material.dart';

class InitialLoginButton extends StatelessWidget {
  const InitialLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: const Text(
        'Login',
        style: TextStyle(
            fontSize: 20,
            fontFamily: 'Edo',
            color: Colors.yellow,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
