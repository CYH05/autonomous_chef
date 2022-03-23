import 'package:autonomous_chef/app/core/helpers/app_exception.dart';

class ILoginException extends AppException {
  const ILoginException({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class EmailOrPasswordInvalidException extends ILoginException {
  EmailOrPasswordInvalidException({
    required StackTrace stackTrace,
  }) : super(
          message: 'Endereço de email ou senha inválidos.',
          stackTrace: stackTrace,
        );
}
