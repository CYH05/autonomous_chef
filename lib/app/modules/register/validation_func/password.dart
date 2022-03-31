import '../domain/helpers/error/error.dart';
import '../domain/helpers/validator/validator.dart';

String? checkPassword(String? password) {
  if (!validateEmail(password!)) {
    const error = PasswordValidationError();
    return error.message;
  }
  return null;
}
