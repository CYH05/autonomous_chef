import 'package:autonomous_chef/app/modules/register/component/custom_text_form_field.dart';
import 'package:autonomous_chef/app/modules/register/register_controller.dart';
import 'package:autonomous_chef/app/modules/register/validation_func/email.dart';
import 'package:autonomous_chef/app/modules/register/validation_func/password.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'domain/helpers/error/error.dart';
import 'domain/helpers/validator/validator.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  late RegisterController _controller;

  @override
  void initState() {
    _controller = RegisterController(store: Modular.get());
    super.initState();
  }

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
              Padding(
                padding: const EdgeInsets.all(12),
                child: CustomTextFormField(
                  controller: _controller.passwordController,
                  label: "Senha",
                  validator: checkPassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Confirme sua senha"),
                  ),
                  validator: (confirmPassword) {
                    if (!comparePassword(
                          _controller.passwordController.text,
                          confirmPassword!,
                        ) ||
                        confirmPassword == "") {
                      const error = PasswordCompararissonnError();
                      return error.message;
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async =>
                    await _controller.callRegisterWithEmailPassword(),
                child: const Text("Enviar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
