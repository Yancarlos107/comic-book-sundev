import 'package:comic_book/pages/initial/widgets/widgets.dart';
import 'package:comic_book/pages/pages.dart';
import 'package:comic_book/styles/decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: userController.text, password: passwordController.text);
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Passwords do not match'),
          duration: Duration(seconds: 5),
        ));
      }
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
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 20, right: 20),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        opacity: 0.6,
        image: AssetImage('assets/images/login_background.png'),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('Register', style: DecorationApp.titleStyle),
              const SizedBox(height: 20),
              InitialFormTextField(
                  hintText: 'email', errorText: '', controller: userController),
              const SizedBox(height: 20),
              InitialFormTextField(
                  hintText: 'password',
                  errorText: '',
                  controller: passwordController),
              const SizedBox(height: 20),
              InitialFormTextField(
                  hintText: 'confirm passowrd',
                  errorText: '',
                  controller: confirmPasswordController),
              const SizedBox(height: 20),
              InitialLoginButton(
                text: 'Register',
                onPressed: signUserUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
