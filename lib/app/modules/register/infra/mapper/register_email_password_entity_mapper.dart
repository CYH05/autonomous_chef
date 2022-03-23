import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';

class RegisterEmailPasswordMapper extends RegisterEmailPasswordEntity {
  const RegisterEmailPasswordMapper({
    required String email,
    required String password,
  }) : super(email: email, password: password);

  factory RegisterEmailPasswordMapper.fromMap(
    Map<String, dynamic> registerEmailPasswordMapper,
  ) {
    return RegisterEmailPasswordMapper(
      email: registerEmailPasswordMapper['email'],
      password: registerEmailPasswordMapper['password'],
    );
  }

  static Map<String, String> toMap(RegisterEmailPasswordEntity registerEntity) {
    return {
      "email": registerEntity.email,
      "password": registerEntity.password,
    };
  }
}
