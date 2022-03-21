import 'exception.dart';

class ExceptionMock {
  final emailAlreadyInUseException = EmailAlreadyInUseException(
    message: '',
    stackTrace: StackTrace.fromString(""),
  );

  final invalidEmailException = InvalidEmailException(
    message: '',
    stackTrace: StackTrace.fromString(""),
  );

  final emailOrPasswordEnabledException = EmailOrPasswordEnabledException(
    message: '',
    stackTrace: StackTrace.fromString(""),
  );

  final weekPasswordException = WeekPasswordException(
    message: '',
    stackTrace: StackTrace.fromString(""),
  );
}
