import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';

class RegisterEmailPasswordMaper extends RegisterEmailPasswordEntity {
  RegisterEmailPasswordMaper({
    required String email,
    required String password,
  }) : super(email: email, password: password);

  factory RegisterEmailPasswordMaper.fromDocument(
    Map<String, dynamic> registerEmailPasswordMaper,
  ) {
    return RegisterEmailPasswordMaper(
      email: registerEmailPasswordMaper['email'],
      password: registerEmailPasswordMaper['password'],
    );
  }
  Map<String, String> toMap() {
    return {
      "email": email,
      "password": password,
    };
  }
}
