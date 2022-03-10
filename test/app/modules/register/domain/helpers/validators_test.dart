import 'package:autonomous_chef/app/modules/register/domain/helpers/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'validateEmail, should return true when email is valid.',
    () {
      const String email = "teste@teste.teste";
      expect(validateEmail(email), true);
    },
  );
  test(
    'validatePassword, should return true when email is valid.',
    () {
      const String password = "Teste@123";
      expect(validatePassword(password), true);
    },
  );
  test(
    'validateEmail, should return false when email is blank.',
    () {
      const String email = "";
      expect(validateEmail(email), false);
    },
  );

  test(
    "validateEmail, should return false when email don't have at(@).",
    () {
      const String email = "testeteste.teste";
      expect(validateEmail(email), false);
    },
  );

  test(
    'validatePassword, should return false when password is blank.',
    () {
      const String password = "";
      expect(validatePassword(password), false);
    },
  );
  test(
    "validatePassword, should return false when password don't reach mininal lenght.",
    () {
      const String password = "Teste@1";
      expect(validatePassword(password), false);
    },
  );
  test(
    "validatePassword, should return false when password don't have at least one uppercase character.",
    () {
      const String password = "teste@123";
      expect(validatePassword(password), false);
    },
  );
  test(
    "validatePassword, should return false when password don't have at least one lowercase character.",
    () {
      const String password = "TESTE@123";
      expect(validatePassword(password), false);
    },
  );
  test(
    "validatePassword, should return false when password don't have at least one special character.",
    () {
      const String password = "TESTE123";
      expect(validatePassword(password), false);
    },
  );
  test(
    "validatePassword, should return false when password don't have at least one digit character.",
    () {
      const String password = "TESTE@!@#";
      expect(validatePassword(password), false);
    },
  );
}
