import 'package:autonomous_chef/app/core/helpers/app_exceptions.dart';

class RegisterException extends AppException {
  RegisterException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class EmailAlreadyInUseException extends RegisterException {
  EmailAlreadyInUseException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class FirebaseAuthCouldNotRegisterException extends RegisterException {
  FirebaseAuthCouldNotRegisterException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
