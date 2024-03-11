import 'package:flutter/material.dart';

import '../../../styles/decoration.dart';

class CustomFormTextField extends StatefulWidget {
  final String hintText;
  final String errorText;
  final TextEditingController? controller;

  const CustomFormTextField({
    super.key,
    required this.hintText,
    required this.errorText,
    this.controller,
  });

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => value!.isEmpty ? widget.errorText : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      style: DecorationApp.formFieldText,
      decoration: InputDecoration(
        errorBorder: DecorationApp.enabledBorder,
        errorStyle: DecorationApp.textErrorFormStyle,
        focusedErrorBorder: DecorationApp.focusedBorder,
        hintText: widget.hintText,
        hintStyle: DecorationApp.textFormStyle,
        enabledBorder: DecorationApp.enabledBorder,
        focusedBorder: DecorationApp.focusedBorder,
      ),
    );
  }
}
