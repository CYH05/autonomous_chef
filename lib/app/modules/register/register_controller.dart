import 'package:autonomous_chef/app/modules/register/register_store.dart';
import 'package:flutter/cupertino.dart';

class RegisterController {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final RegisterStore store;

  const RegisterController({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.store,
  });

  Future<void> callRegisterWithEmailPassword() async {
    if (formKey.currentState!.validate()) {
      await store.registerEmailPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }
}
