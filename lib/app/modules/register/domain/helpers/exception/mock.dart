import 'exception.dart';

class ExceptionMock {
  final emailAlreadyInUseException = EmailAlreadyInUseException(
    stackTrace: StackTrace.fromString(""),
  );

  final invalidEmailException = InvalidEmailException(
    stackTrace: StackTrace.fromString(""),
  );

  final emailOrPasswordEnabledException = EmailOrPasswordEnabledException(
    stackTrace: StackTrace.fromString(""),
  );

  final weekPasswordException = WeekPasswordException(
    stackTrace: StackTrace.fromString(""),
  );
}
