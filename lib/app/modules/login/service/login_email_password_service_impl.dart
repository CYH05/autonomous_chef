import 'package:autonomous_chef/app/modules/login/external/service/login_email_password_serivce_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../domain/helpers/exception/exception.dart';

class LoginEmailPasswordServiceImpl implements ILoginEmailPasswordService {
  final FirebaseAuth _firebaseAuth;

  const LoginEmailPasswordServiceImpl({required firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<Unit> loginEmailPassword(Map<String, dynamic> map) async {
    try {
      UserCredential credential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: map['email'],
        password: map['password'],
      );

      final user = credential.user;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == "user-disabled") {
        throw UserDisabledException();
      }

      if (exception.code == "user-not-found") {
        throw UserNotFoundException();
      }

      throw EmailOrPasswordInvalidException();
    }
    return unit;
  }
}
