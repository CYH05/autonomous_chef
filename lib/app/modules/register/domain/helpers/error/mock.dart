import 'error.dart';

//TODO ver a necessidade dessa classe
class ErrorMock {
  final emailValidationError = const EmailValidationError(message: '');
  final passwordValidationError = const PasswordValidationError(message: '');
}
