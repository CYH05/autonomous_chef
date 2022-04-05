import 'package:autonomous_chef/app/core/helpers/app_exception.dart';

class ResetPasswordException extends AppException {
  const ResetPasswordException({
    required String message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class InvalidEmailException extends ResetPasswordException {
  const InvalidEmailException({StackTrace? stackTrace})
      : super(
          message: "Email inválido.",
          stackTrace: stackTrace,
        );
}

class MissingAndroidPackageNameException extends ResetPasswordException {
  const MissingAndroidPackageNameException({StackTrace? stackTrace})
      : super(
          message:
              "O nome do pacote android deve ser informado caso o aplicativo android seja necessário para ser instalado.",
          stackTrace: stackTrace,
        );
}

class MissingContinueURIException extends ResetPasswordException {
  const MissingContinueURIException({StackTrace? stackTrace})
      : super(
          message: "A URI de continuação deve ser informada ma requisição.",
          stackTrace: stackTrace,
        );
}

class MissingIOSBundleIdException extends ResetPasswordException {
  const MissingIOSBundleIdException({StackTrace? stackTrace})
      : super(
          message:
              "O id do bundle do IOS deve ser informado caso o id da app store seja informado.",
          stackTrace: stackTrace,
        );
}

class InvalidContinueURIException extends ResetPasswordException {
  const InvalidContinueURIException({
    StackTrace? stackTrace,
  }) : super(
          message: "A URI de continuação é inválida.",
          stackTrace: stackTrace,
        );
}

class UnauthorizedContinueURIException extends ResetPasswordException {
  const UnauthorizedContinueURIException({
    StackTrace? stackTrace,
  }) : super(
          message: "O domínio da URL não esta na whiteList do projeto.",
          stackTrace: stackTrace,
        );
}

class UserNotFoundException extends ResetPasswordException {
  const UserNotFoundException({
    StackTrace? stackTrace,
  }) : super(
          message: "Não há usuário com este e-mail.",
          stackTrace: stackTrace,
        );
}
