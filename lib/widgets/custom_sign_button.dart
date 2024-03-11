import 'package:flutter/material.dart';

class CustomSignButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const CustomSignButton({
    super.key,
    required this.onPressed,
    required this.text,
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
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Edo',
            color: Colors.yellow,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
