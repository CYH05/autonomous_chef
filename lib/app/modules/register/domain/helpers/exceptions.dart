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

class InvalidEmailException extends RegisterException {
  InvalidEmailException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class EmailOrPasswordEnabledException extends RegisterException {
  EmailOrPasswordEnabledException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class WeekPasswordException extends RegisterException {
  WeekPasswordException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
