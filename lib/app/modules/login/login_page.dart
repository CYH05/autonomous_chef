import 'package:autonomous_chef/app/modules/register/component/custom_text_form_field.dart';
import 'package:autonomous_chef/app/modules/register/validation_func/email.dart';
import 'package:autonomous_chef/app/modules/register/validation_func/password.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  late LoginController _controller;

  @override
  void initState() {
    _controller = LoginController(
      store: Modular.get(),
    );
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
              //TODO trocar a função pela classe stateless que vier da branch %5
              Padding(
                padding: const EdgeInsets.all(12),
                child: customTextFormField(
                  controller: _controller.emailController,
                  label: "Email",
                  validator: checkEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: customTextFormField(
                  controller: _controller.passwordController,
                  label: "Senha",
                  validator: checkPassword,
                ),
              ),

              ElevatedButton(
                onPressed: () async =>
                    await _controller.callLoginWithEmailPassword(),
                child: const Text("Enviar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
