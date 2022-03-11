import 'package:autonomous_chef/app/core/helpers/app_exceptions.dart';

class RegisterError extends AppError {
  RegisterError({required String message}) : super(message: message);
}

class EmailValidationError extends RegisterError {
  EmailValidationError({
    required String message,
  }) : super(message: message);
}

class PasswordValidationError extends RegisterError {
  //TODO
  PasswordValidationError({required String message}) : super(message: message);
}
