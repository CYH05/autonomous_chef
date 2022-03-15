import 'package:autonomous_chef/app/modules/register/external/services/firebase_auth_service_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/entity/register_email_password_entity.dart';
import '../domain/helpers/exceptions.dart';

class FirebaseAuthServiceImpl implements IFirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthServiceImpl(this._firebaseAuth);

  @override
  Future<RegisterEmailPasswordEntity> registerFirebaseAuth(
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
    return RegisterEmailPasswordEntity(
      email: map['email'],
      password: map['password'],
    );
  }
}
