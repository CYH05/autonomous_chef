import 'package:autonomous_chef/app/modules/register/domain/helpers/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing validation to email and password - success", () {
    testWidgets('Email validation', (tester) async {
      const String email = "teste@teste.teste";
      expect(validateEmail(email), true);
    });
    testWidgets('Password validation', (tester) async {
      const String password = "Teste@123";
      expect(validatePassword(password), true);
    });
  });
  group("Email validation failures", () {
    testWidgets('Email validation with blank email - failure', (tester) async {
      const String email = "";
      expect(validateEmail(email), false);
    });

    testWidgets('Email validation with invalid email (without at(@))- failure',
        (tester) async {
      const String email = "testeteste.teste";
      expect(validateEmail(email), false);
    });
  });

  group("password validation failures", () {
    testWidgets('Password validation with blank password - failure',
        (tester) async {
      const String password = "";
      expect(validatePassword(password), false);
    });
    testWidgets('Password validation with insufficient characters - failure',
        (tester) async {
      const String password = "Teste@1";
      expect(validatePassword(password), false);
    });
    testWidgets('Password validation without uppercase charater - failure',
        (tester) async {
      const String password = "teste@123";
      expect(validatePassword(password), false);
    });
    testWidgets('Password validation without lowercase charater - failure',
        (tester) async {
      const String password = "TESTE@123";
      expect(validatePassword(password), false);
    });
    testWidgets('Password validation without special charater - failure',
        (tester) async {
      const String password = "TESTE123";
      expect(validatePassword(password), false);
    });
    testWidgets('Password validation without digit charater - failure',
        (tester) async {
      const String password = "TESTE@!@#";
      expect(validatePassword(password), false);
    });
  });
}
