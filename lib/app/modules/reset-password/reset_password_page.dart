import 'package:autonomous_chef/app/modules/reset-password/reset_password_controller.dart';
import 'package:autonomous_chef/app/modules/reset-password/reset_password_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../core/components/custom_text_form_field.dart';
import '../register/validation_func/email.dart';

class ResetPasswordPage extends StatefulWidget {
  final String title;
  const ResetPasswordPage({Key? key, this.title = 'ResetPasswordPage'})
      : super(key: key);
  @override
  ResetPasswordPageState createState() => ResetPasswordPageState();
}

class ResetPasswordPageState extends State<ResetPasswordPage> {
  final ResetPasswordStore _store = Modular.get();
  final ResetPasswordController _controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: CustomTextFormField(
                  controller: _controller.emailController,
                  label: "Email",
                  validator: checkEmail,
                ),
              ),
              ScopedBuilder(
                store: _store,
                onLoading: (_) => const CircularProgressIndicator(),
                onError: (_, triple) => Column(
                  children: [
                    AlertDialog(
                      title: Text(_store.error!.message),
                    ),
                    ElevatedButton(
                      onPressed: () async =>
                          _controller.sendResetPasswordEmail(),
                      child: const Text("Enviar"),
                    ),
                  ],
                ),
                onState: (_, triple) => ElevatedButton(
                  onPressed: () async => _controller.sendResetPasswordEmail(),
                  child: const Text("Enviar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
