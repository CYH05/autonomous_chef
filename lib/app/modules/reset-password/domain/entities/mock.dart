import 'email_reset_password_entity.dart';

class EmailResetPasswordEntityMock {
  final entityValid =
      const EmailResetPasswordEntity(email: "teste@teste.teste");

  final entityInvalid =
      const EmailResetPasswordEntity(email: "testeteste.teste");
}
