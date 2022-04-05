import '../../../core/helpers/validator/email_validator.dart';
import '../domain/helpers/error/error.dart';

String? checkEmail(String? email) {
  if (!validateEmail(email!)) {
    const error = EmailValidationError();
    return error.message;
  }
  return null;
}
