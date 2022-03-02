import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../firebase/auth/services/register_interface.dart';

class RegisterStore extends NotifierStore<Exception, int> {
  final IRegister _register;
  final email = TextEditingController();
  final password = TextEditingController();
  RegisterStore(this._register) : super(0);

  Future register() async {
    var response = await _register.registerWithEmailAndPassword(
        email: email.text, password: password.text);

    return response;
  }
}
