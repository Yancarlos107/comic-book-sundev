import 'package:flutter/material.dart';

class InitialLoginButton extends StatelessWidget {
  final Function()? onPressed;

  const InitialLoginButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
