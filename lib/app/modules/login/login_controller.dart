import 'package:autonomous_chef/app/modules/login/login_store.dart';
import 'package:flutter/cupertino.dart';

class LoginController {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final LoginStore store;

  LoginController({required this.store})
      : emailController = TextEditingController(),
        passwordController = TextEditingController(),
        formKey = GlobalKey<FormState>();

  Future<void> callLoginWithEmailPassword() async {
    if (formKey.currentState!.validate()) {
      await store.loginEmailPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }
}
