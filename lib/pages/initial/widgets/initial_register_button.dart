import 'package:flutter/material.dart';

class InitialRegisterButton extends StatelessWidget {
  const InitialRegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Not a member?',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Edo',
                  color: Colors.yellow.shade300),
            ),
            Text(
              'Register now!',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Edo',
                  color: Colors.yellow.shade300),
            ),
          ],
        ),
      ),
    );
  }
}
