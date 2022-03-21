import 'package:autonomous_chef/app/core/helpers/app_exception.dart';

class RegisterError extends AppError {
  const RegisterError({required String message}) : super(message: message);
}

class EmailValidationError extends RegisterError {
  const EmailValidationError({
    required String message,
  }) : super(message: message);
}

class PasswordValidationError extends RegisterError {
  const PasswordValidationError({required String message})
      : super(message: message);
}
