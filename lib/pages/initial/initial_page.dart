// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:comic_book/controllers/auth_controller.dart';
import 'package:comic_book/pages/initial/widgets/widgets.dart';
import 'package:provider/provider.dart';

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

class InitialContent extends StatefulWidget {
  const InitialContent({
    super.key,
  });

  @override
  State<InitialContent> createState() => _InitialContentState();
}

class _InitialContentState extends State<InitialContent> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const InitialFormLogo(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          InitialFormTextField(
            hintText: 'Email',
            errorText: 'Enter an valid email',
            controller: authProvider.userController,
          ),
          SizedBox(
            height: authProvider.height,
          ),
          InitialFormTextField(
            hintText: 'Password',
            errorText: 'Enter an valid password',
            controller: authProvider.passwordController,
          ),
          SizedBox(
            height: authProvider.height,
          ),
          InitialLoginButton(text: 'Login', onPressed: authProvider.signInUser),
          SizedBox(
            height: authProvider.height,
          ),
          const InitialSeparatorForm(),
          const SizedBox(
            height: 20,
          ),
          LogoGoogle(
            onTap: () => authProvider.loginWithGoogle(),
          ),
          const InitialRegisterButton()
        ],
      ),
    );
  }
}
