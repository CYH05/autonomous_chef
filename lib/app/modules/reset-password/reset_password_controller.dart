import 'package:autonomous_chef/app/modules/reset-password/reset_password_store.dart';
import 'package:flutter/material.dart';

class ResetPasswordController {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ResetPasswordStore store;

  ResetPasswordController({required this.store});

  void sendResetPasswordEmail() async {
    if (formKey.currentState!.validate()) {
      await store.sendResetPasswordEmail(
        email: emailController.text,
      );
    }
  }
}
