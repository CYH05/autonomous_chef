import 'package:autonomous_chef/app/core/helpers/app_exception.dart';

class RegisterException extends AppException {
  const RegisterException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class EmailAlreadyInUseException extends RegisterException {
  const EmailAlreadyInUseException({
    required StackTrace stackTrace,
  }) : super(
          message: 'Este email já esta sendo utilizado.',
          stackTrace: stackTrace,
        );
}

class InvalidEmailException extends RegisterException {
  const InvalidEmailException({
    required StackTrace stackTrace,
  }) : super(message: 'Endereço de email inválida.', stackTrace: stackTrace);
}

class EmailOrPasswordEnabledException extends RegisterException {
  const EmailOrPasswordEnabledException({
    required StackTrace stackTrace,
  }) : super(
          message:
              'Email ou senha estão desabilitados, habilite a opção no console do firebase.',
          stackTrace: stackTrace,
        );
}

class WeekPasswordException extends RegisterException {
  const WeekPasswordException({
    required StackTrace stackTrace,
  }) : super(
          message: 'A senha é considerada muito fraca.',
          stackTrace: stackTrace,
        );
}
