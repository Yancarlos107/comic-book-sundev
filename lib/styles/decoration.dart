import 'package:comic_book/styles/colors_constant.dart';
import 'package:flutter/material.dart';

class DecorationApp {
  static TextStyle textFormStyle = TextStyle(
    color: ColorsContstant.primaryColor,
    fontSize: 20,
    fontFamily: 'Edo',
  );

  static TextStyle textErrorFormStyle = TextStyle(
    color: ColorsContstant.primaryColor,
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

  static TextStyle formFieldText = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400);

  static TextStyle titleStyle = TextStyle(
      fontSize: 60, fontFamily: 'Edo', color: ColorsContstant.primaryColor);
}
