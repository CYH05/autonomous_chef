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
      final UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: paramEntity.email,
        password: paramEntity.password,
      );
      final user = credential.user;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == "email-already-in-use") {
        throw const EmailAlreadyInUseException();
      }
      if (exception.code == "invalid-email") {
        throw const InvalidEmailException();
      }
      if (exception.code == "operation-not-allowed") {
        throw const EmailOrPasswordEnabledException();
      }
      if (exception.code == "weak-password") {
        throw const WeekPasswordException();
      }
    }
    return unit;
  }
}
