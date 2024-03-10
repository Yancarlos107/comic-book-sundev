import 'package:comic_book/styles/decoration.dart';
import 'package:flutter/material.dart';

class InitialFormLogo extends StatelessWidget {
  const InitialFormLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/images/comic_pop_up.png'),
        RotationTransition(
          turns: const AlwaysStoppedAnimation(-30 / 360),
          child: Text('Comic      Book',
              textAlign: TextAlign.center, style: DecorationApp.titleStyle),
        ),
      ],
    );
  }
}
