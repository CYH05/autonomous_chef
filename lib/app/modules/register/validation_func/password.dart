import '../../../core/helpers/validator/email_validator.dart';
import '../domain/helpers/error/error.dart';

String? checkPassword(String? password) {
  if (!validateEmail(password!)) {
    const error = PasswordValidationError();
    return error.message;
  }
  return null;
}
