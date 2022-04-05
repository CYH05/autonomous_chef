import 'package:autonomous_chef/app/modules/register/register_store.dart';
import 'package:flutter/cupertino.dart';

class RegisterController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RegisterStore store;

  RegisterController({
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
