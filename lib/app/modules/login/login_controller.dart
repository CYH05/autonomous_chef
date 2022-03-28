import 'package:autonomous_chef/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey;
  final LoginStore store;

  LoginController({required this.formKey, required this.store});

  Future<void> callLoginWithEmailPassword() async {
    if (formKey.currentState!.validate()) {
      await store.loginEmailPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }
}
