import 'package:autonomous_chef/app/core/helpers/app_exception.dart';

class RegisterError extends AppError {
  const RegisterError({required String message}) : super(message: message);
}

class EmailValidationError extends RegisterError {
  const EmailValidationError()
      : super(message: 'Informe um endereço de email válido.');
}

class PasswordValidationError extends RegisterError {
  const PasswordValidationError()
      : super(
          message:
              'Sua senha deve conter ao menos:\n8 caracteres;\n1 caractere minusculo;\n1 caractere maisculo;\n1 múmero;\n1 caractere especial.',
        );
}

class PasswordCompararissonnError extends RegisterError {
  const PasswordCompararissonnError()
      : super(
          message: 'As senhas não são identicas.',
        );
}
