import '../domain/helpers/error/error.dart';
import '../domain/helpers/validator/validator.dart';

String? checkEmail(String? email) {
  if (!validateEmail(email!)) {
    const error = EmailValidationError();
    return error.message;
  }
  return null;
}
