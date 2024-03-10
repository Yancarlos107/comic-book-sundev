// ignore_for_file: use_build_context_synchronously

import 'package:comic_book/pages/initial/widgets/widgets.dart';
import 'package:comic_book/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

class InitialContent extends StatefulWidget {
  const InitialContent({
    super.key,
  });

  @override
  State<InitialContent> createState() => _InitialContentState();
}

class _InitialContentState extends State<InitialContent> {
  final _height = 20.0;

  final userController = TextEditingController();

  final passwordController = TextEditingController();

  void signInUser() async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message!),
        duration: const Duration(seconds: 5),
      ));
    }
  }

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
          InitialFormTextField(
            hintText: 'Email',
            errorText: 'Enter an valid email',
            controller: userController,
          ),
          SizedBox(
            height: _height,
          ),
          InitialFormTextField(
            hintText: 'Password',
            errorText: 'Enter an valid password',
            controller: passwordController,
          ),
          SizedBox(
            height: _height,
          ),
          InitialLoginButton(text: 'Login', onPressed: signInUser),
          SizedBox(
            height: _height,
          ),
          const InitialSeparatorForm(),
          const SizedBox(
            height: 20,
          ),
          LogoGoogle(
            onTap: () => AuthService().signInWithGoogle(),
          ),
          const InitialRegisterButton()
        ],
      ),
    );
  }
}
