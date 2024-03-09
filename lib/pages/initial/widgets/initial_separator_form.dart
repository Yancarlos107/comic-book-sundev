import 'package:flutter/material.dart';

class InitialSeparatorForm extends StatelessWidget {
  const InitialSeparatorForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.yellow.shade300,
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Or continue with',
            style: TextStyle(
                color: Colors.yellow.shade300, fontSize: 20, fontFamily: 'Edo'),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.yellow.shade300,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
