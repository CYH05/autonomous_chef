import 'package:autonomous_chef/app/modules/login/login_store.dart';
import 'package:autonomous_chef/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../core/components/custom_text_form_field.dart';
import '../register/validation_func/email.dart';
import '../register/validation_func/password.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginController _controller = Modular.get();
  final LoginStore _store = Modular.get();

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
                        await _controller.callLoginWithEmailPassword(),
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
              onState: (_, triple) => ElevatedButton(
                onPressed: () async =>
                    await _controller.callLoginWithEmailPassword(),
                child: const Text('Entrar'),
              ),
            ),
            GestureDetector(
              child: const Text("Esqueci minha senha"),
              onTap: () {
                Modular.to.navigate('/reset-password/');
              },
            ),
            GestureDetector(
              child: const Text("Quero me cadastrar"),
              onTap: () {
                Modular.to.navigate('/register/');
              },
            ),
          ],
        ),
      ),
    ));
  }
}
