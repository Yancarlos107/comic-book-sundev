import 'package:comic_book/pages/initial/widgets/widgets.dart';
import 'package:comic_book/styles/decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/register_controller.dart';
import '../../widgets/custom_form_text_field.dart';
import '../../widgets/custom_sign_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);

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
              CustomFormTextField(
                  hintText: 'email',
                  errorText: '',
                  controller: registerProvider.userController),
              const SizedBox(height: 20),
              CustomFormTextField(
                  hintText: 'password',
                  errorText: '',
                  controller: registerProvider.passwordController),
              const SizedBox(height: 20),
              CustomFormTextField(
                  hintText: 'confirm passowrd',
                  errorText: '',
                  controller: registerProvider.confirmPasswordController),
              const SizedBox(height: 20),
              CustomSignButton(
                text: 'Register',
                onPressed: registerProvider.signUserUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
