import 'package:autonomous_chef/app/firebase/auth/models/user_model.dart';
import 'package:autonomous_chef/app/firebase/auth/services/authentication_interface.dart';
import 'package:flutter/material.dart';

import 'package:flutter_triple/flutter_triple.dart';

class LoginStore extends NotifierStore<Exception, int> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  String errorMessage = "";
  final IAuthentication _authentication;
  LoginStore(this._authentication) : super(0);

  Future<Map<String, dynamic>> login() async {
    Map<String, dynamic> auth = await _authentication.login(
      email: emailTextController.text,
      password: passwordTextController.text,
    );
    emailTextController.text = "";
    passwordTextController.text = "";
    if (!auth['isAuthenticated']) {
      errorMessage = auth["errorMessage"];
    }

    return auth;
  }

  validateLogin(Map<String, dynamic> auth, modularNavigator) {
    if (auth['isAuthenticated']) {
      modularNavigator.to.pushNamed("/home/", arguments: User(auth["UID"]));
    }
  }
}
