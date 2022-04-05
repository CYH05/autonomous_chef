import 'package:autonomous_chef/app/core/helpers/app_exception.dart';

class ILoginException extends AppException {
  const ILoginException({
    required String message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class EmailOrPasswordInvalidException extends ILoginException {
  EmailOrPasswordInvalidException({
    StackTrace? stackTrace,
  }) : super(
          message: 'Endereço de email ou senha inválidos.',
          stackTrace: stackTrace,
        );
}

class UserNotFoundException extends ILoginException {
  UserNotFoundException({
     StackTrace? stackTrace,
  }) : super(
          message: 'Usuário com este e-mail não encontrado.',
          stackTrace: stackTrace,
        );
}

class UserDisabledException extends ILoginException {
  UserDisabledException({
    StackTrace? stackTrace,
  }) : super(
          message: 'Usuário desabilidado.',
          stackTrace: stackTrace,
        );
}
