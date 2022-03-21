import 'package:autonomous_chef/app/modules/register/register_store.dart';
import 'package:flutter/cupertino.dart';

class RegisterController {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey;
  final RegisterStore _store;

  const RegisterController({
    required emailController,
    required passwordController,
    required formKey,
    required store,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _formKey = formKey,
        _store = store;

  Future<void> callRegisterWithEmailPassword() async {
    if (_formKey.currentState!.validate()) {
      await _store.registerEmailPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }
}
