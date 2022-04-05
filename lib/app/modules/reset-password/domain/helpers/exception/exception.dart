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

class InvalidEmail extends ResetPasswordException {
  const InvalidEmail({StackTrace? stackTrace})
      : super(
          message: "Email inválido.",
          stackTrace: stackTrace,
        );
}

class MissingAndroidPackageName extends ResetPasswordException {
  const MissingAndroidPackageName({StackTrace? stackTrace})
      : super(
          message:
              "O nome do pacote android deve ser informado caso o aplicativo android seja necessário para ser instalado.",
          stackTrace: stackTrace,
        );
}

class MissingContinueURI extends ResetPasswordException {
  const MissingContinueURI({StackTrace? stackTrace})
      : super(
          message: "A URI de continuação deve ser informada ma requisição.",
          stackTrace: stackTrace,
        );
}

class MissingIOSBundleId extends ResetPasswordException {
  const MissingIOSBundleId({StackTrace? stackTrace})
      : super(
          message:
              "O id do bundle do IOS deve ser informado caso o id da app store seja informado.",
          stackTrace: stackTrace,
        );
}

class InvalidContinueURI extends ResetPasswordException {
  const InvalidContinueURI({
    StackTrace? stackTrace,
  }) : super(
          message: "A URI de continuação é inválida.",
          stackTrace: stackTrace,
        );
}

class UnauthorizedContinueURI extends ResetPasswordException {
  const UnauthorizedContinueURI({
    StackTrace? stackTrace,
  }) : super(
          message: "O domínio da URL não esta na whiteList do projeto.",
          stackTrace: stackTrace,
        );
}

class UserNotFound extends ResetPasswordException {
  const UserNotFound({
    StackTrace? stackTrace,
  }) : super(
          message: "Não há usuário com este e-mail.",
          stackTrace: stackTrace,
        );
}
