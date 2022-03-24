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
      _firebaseAuth.signInWithEmailAndPassword(
        email: map['email'],
        password: map['password'],
      );
    } on FirebaseAuthException catch (exception) {
      if (exception.code == "user-disabled") {
        throw UserDisabledException(
          stackTrace: exception.stackTrace!,
        );
      }

      if (exception.code == "user-not-found") {
        throw UserNotFoundException(
          stackTrace: exception.stackTrace!,
        );
      }

      throw EmailOrPasswordInvalidException(
        stackTrace: exception.stackTrace!,
      );
    }

    return unit;
  }
}
