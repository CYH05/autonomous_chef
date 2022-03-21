import 'package:autonomous_chef/app/core/helpers/app_exception.dart';

class RegisterException extends AppException {
  const RegisterException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class EmailAlreadyInUseException extends RegisterException {
  const EmailAlreadyInUseException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class InvalidEmailException extends RegisterException {
  const InvalidEmailException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class EmailOrPasswordEnabledException extends RegisterException {
  const EmailOrPasswordEnabledException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class WeekPasswordException extends RegisterException {
  const WeekPasswordException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
