import 'package:autonomous_chef/app/modules/reset-password/domain/entities/email_reset_password_entity.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/helpers/exception/exception.dart';
import 'package:autonomous_chef/app/modules/reset-password/external/service/email_reset_password_service_interface.dart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class EmailResetPasswordServiceImpl implements IEmailResetPasswordService {
  final FirebaseAuth _firebase;

  const EmailResetPasswordServiceImpl({required firebase})
      : _firebase = firebase;

  @override
  Future<Unit> sendResetEmail(EmailResetPasswordEntity entity) async {
    try {
      await _firebase.sendPasswordResetEmail(email: entity.email);
    } on FirebaseAuthException catch (exception, stackTrace) {
      if (exception.code == "auth/invalid-email") {
        throw InvalidEmailException(
          stackTrace: stackTrace,
        );
      }
      if (exception.code == "auth/missing-android-pkg-name") {
        throw MissingAndroidPackageNameException(
          stackTrace: stackTrace,
        );
      }
      if (exception.code == "auth/missing-continue-uri") {
        throw MissingContinueURIException(
          stackTrace: stackTrace,
        );
      }
      if (exception.code == "auth/missing-ios-bundle-id") {
        throw MissingIOSBundleIdException(
          stackTrace: stackTrace,
        );
      }
      if (exception.code == "auth/invalid-continue-uri") {
        throw InvalidContinueURIException(
          stackTrace: stackTrace,
        );
      }
      if (exception.code == "auth/unauthorized-continue-uri") {
        throw UnauthorizedContinueURIException(
          stackTrace: stackTrace,
        );
      }
      if (exception.code == "auth/user-not-found") {
        throw UserNotFoundException(
          stackTrace: stackTrace,
        );
      }
    }
    return unit;
  }
}
