import 'package:autonomous_chef/app/modules/register/external/services/firebase_auth_service_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../domain/helpers/exception/exception.dart';

class FirebaseAuthServiceImpl implements IFirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  const FirebaseAuthServiceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<Unit> registerFirebaseAuth(
    Map<String, dynamic> map,
  ) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
        email: map['email'],
        password: map['password'],
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        throw EmailAlreadyInUseException(
          message: error.message!,
          stackTrace: error.stackTrace!,
        );
      }
      if (error.code == "invalid-email") {
        throw InvalidEmailException(
          message: error.message!,
          stackTrace: error.stackTrace!,
        );
      }
      if (error.code == "operation-not-allowed") {
        throw EmailOrPasswordEnabledException(
          message: error.message!,
          stackTrace: error.stackTrace!,
        );
      }
      if (error.code == "weak-password") {
        throw WeekPasswordException(
          message: error.message!,
          stackTrace: error.stackTrace!,
        );
      }
    }
    return unit;
  }
}
