import 'package:flutter/material.dart';

class DecorationApp {
  static Color primaryColor = Colors.yellow.shade300;

  static TextStyle textFormStyle = TextStyle(
    color: primaryColor,
    fontSize: 20,
    fontFamily: 'Edo',
  );

  static TextStyle textErrorFormStyle = TextStyle(
    color: primaryColor,
    fontSize: 14,
    fontFamily: 'Edo',
  );

  static InputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      color: Colors.yellow,
      width: 2,
      style: BorderStyle.solid,
    ),
  );

  static InputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      color: Colors.white,
      width: 2,
      style: BorderStyle.solid,
    ),
  );

  static TextStyle formFieldText = TextStyle(
      color: primaryColor,
      fontSize: 16,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400);
}
