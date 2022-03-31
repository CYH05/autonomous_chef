import 'package:autonomous_chef/app/modules/register/domain/helpers/validator/mock.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/validator/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late EmailPasswordValidatorMock _mock;

  setUp(() {
    _mock = EmailPasswordValidatorMock();
  });

  test(
    'validateEmail, should return true when email is valid.',
    () {
      expect(validateEmail(_mock.validEmail), true);
    },
  );
  test(
    'validatePassword, should return true when email is valid.',
    () {
      expect(validatePassword(_mock.validPassword), true);
    },
  );
  test(
    'validateEmail, should return false when email is blank.',
    () {
      expect(validateEmail(_mock.emailBlank), false);
    },
  );

  test(
    "validateEmail, should return false when email don't have at(@).",
    () {
      expect(validateEmail(_mock.invalidEmail), false);
    },
  );

  test(
    'validatePassword, should return false when password is blank.',
    () {
      expect(validatePassword(_mock.passwordBlank), false);
    },
  );
  test(
    "validatePassword, should return false when password don't reach mininal length.",
    () {
      expect(validatePassword(_mock.passwordWithoutMinLength), false);
    },
  );
  test(
    "validatePassword, should return false when password don't have at least an uppercase character.",
    () {
      expect(validatePassword(_mock.passwordWithoutUppercase), false);
    },
  );
  test(
    "validatePassword, should return false when password don't have at least an lowercase character.",
    () {
      expect(validatePassword(_mock.passwordWithoutLowercase), false);
    },
  );
  test(
    "validatePassword, should return false when password don't have at least an special character.",
    () {
      expect(validatePassword(_mock.passwordWithoutSpecial), false);
    },
  );
  test(
    "validatePassword, should return false when password don't have at least an digit character.",
    () {
      expect(validatePassword(_mock.passwordWithoutDigit), false);
    },
  );
}
