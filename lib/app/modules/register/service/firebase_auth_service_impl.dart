import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
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
    RegisterEmailPasswordEntity paramEntity,
  ) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
        email: paramEntity.email,
        password: paramEntity.password,
      );
    } on FirebaseAuthException catch (exception) {
      if (exception.code == "email-already-in-use") {
        throw EmailAlreadyInUseException(
          stackTrace: exception.stackTrace!,
        );
      }
      if (exception.code == "invalid-email") {
        throw InvalidEmailException(
          stackTrace: exception.stackTrace!,
        );
      }
      if (exception.code == "operation-not-allowed") {
        throw EmailOrPasswordEnabledException(
          stackTrace: exception.stackTrace!,
        );
      }
      if (exception.code == "weak-password") {
        throw WeekPasswordException(
          stackTrace: exception.stackTrace!,
        );
      }
    }
    return unit;
  }
}
