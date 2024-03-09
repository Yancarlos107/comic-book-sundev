import 'package:comic_book/pages/initial/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 20, right: 20),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        opacity: 0.7,
        image: AssetImage('assets/images/login_background.png'),
        fit: BoxFit.fill,
      )),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: InitialContent(),
      ),
    );
  }
}

class InitialContent extends StatelessWidget {
  const InitialContent({
    super.key,
  });

  final _height = 20.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const InitialFormLogo(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const InitialFormTextField(
            hintText: 'Email',
            errorText: 'Enter an valid email',
          ),
          SizedBox(
            height: _height,
          ),
          const InitialFormTextField(
            hintText: 'Password',
            errorText: 'Enter an valid password',
          ),
          SizedBox(
            height: _height,
          ),
          const InitialLoginButton(),
          SizedBox(
            height: _height,
          ),
          const InitialSeparatorForm(),
          const SizedBox(
            height: 20,
          ),
          const LogoGoogle(),
          const InitialRegisterButton()
        ],
      ),
    );
  }
}
