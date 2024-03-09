import 'package:flutter/material.dart';

class LogoGoogle extends StatelessWidget {
  const LogoGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50, child: Image.asset('assets/images/google_logo.png'));
  }
}
