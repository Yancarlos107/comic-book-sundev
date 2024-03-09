import 'package:flutter/material.dart';

import '../../../styles/decoration.dart';

class InitialFormTextField extends StatelessWidget {
  final String hintText;
  final String errorText;
  final TextEditingController? controller;

  const InitialFormTextField({
    super.key,
    required this.hintText,
    required this.errorText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => value!.isEmpty ? errorText : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: DecorationApp.formFieldText,
      decoration: InputDecoration(
        errorBorder: DecorationApp.enabledBorder,
        errorStyle: DecorationApp.textErrorFormStyle,
        focusedErrorBorder: DecorationApp.focusedBorder,
        hintText: hintText,
        hintStyle: DecorationApp.textFormStyle,
        enabledBorder: DecorationApp.enabledBorder,
        focusedBorder: DecorationApp.focusedBorder,
      ),
    );
  }
}
