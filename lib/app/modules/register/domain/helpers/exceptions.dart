import 'package:autonomous_chef/app/core/helpers/app_exceptions.dart';

class RegisterException extends AppError {
  RegisterException({required String message}) : super(message: message);
}

class EmailAddressInvalidException extends RegisterException {
  EmailAddressInvalidException({
    required String message,
  }) : super(message: message);
}

class PasswordInvalidException extends RegisterException {
  PasswordInvalidException({required String message}) : super(message: message);
}
