import '../../domain/entities/login_email_password_entity.dart';

class LoginEmailPasswordEntityMapper {
  final String email;
  final String password;

  const LoginEmailPasswordEntityMapper({
    required this.email,
    required this.password,
  });

  static Map<String, dynamic> toMap(LoginEmailPasswordEntity entity) {
    return {
      "email": entity.email,
      "password": entity.password,
    };
  }
}
