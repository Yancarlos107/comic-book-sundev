import 'package:flutter/material.dart';

class LogoGoogle extends StatelessWidget {
  final Function()? onTap;
  const LogoGoogle({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          height: 50, child: Image.asset('assets/images/google_logo.png')),
    );
  }
}
