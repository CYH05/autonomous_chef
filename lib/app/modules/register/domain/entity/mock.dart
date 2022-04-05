import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/entity/entity_fields_mock.dart';

final mock = EmailPasswordValidatorMock();

class RegisterEmailPasswordMock {
  final entityValid = RegisterEmailPasswordEntity(
    email: mock.validEmail,
    password: mock.validPassword,
  );

  final entityInvalidEmail = RegisterEmailPasswordEntity(
    email: mock.invalidEmail,
    password: mock.validPassword,
  );

  final entityWeekPassword = RegisterEmailPasswordEntity(
    email: mock.validEmail,
    password: mock.passwordWithoutMinLength,
  );

  final entityInvalidPassword = RegisterEmailPasswordEntity(
    email: mock.validEmail,
    password: mock.passwordWithoutUppercase,
  );
}
