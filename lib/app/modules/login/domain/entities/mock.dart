import 'package:autonomous_chef/app/modules/login/domain/entities/login_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/entity/entity_fields_mock.dart';

final mock = EmailPasswordValidatorMock();

class LoginEmailPasswordEntityMock {
  final entityValid = LoginEmailPasswordEntity(
    email: mock.validEmail,
    password: mock.validPassword,
  );
  final entityInvalid = LoginEmailPasswordEntity(
    email: mock.invalidEmail,
    password: mock.validPassword,
  );
}
