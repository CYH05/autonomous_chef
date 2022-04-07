import 'package:mocktail/mocktail.dart';

import 'exception.dart';

class ResetPasswordExceptionMock extends Mock implements ResetPasswordException{}

class InvalidEmailExceptionMock extends Mock implements InvalidEmailException {}

class MissingAndroidPackageNameExceptionMock extends Mock
    implements MissingAndroidPackageNameException {}

class MissingContinueURIExceptionMock extends Mock implements MissingContinueURIException {}

class MissingIOSBundleIdExceptionMock extends Mock implements MissingIOSBundleIdException {}

class InvalidContinueURIExceptionMock extends Mock implements InvalidContinueURIException {}

class UnauthorizedContinueURIExceptionMock extends Mock
    implements UnauthorizedContinueURIException {}

class UserNotFoundExceptionMock extends Mock implements UserNotFoundException {}
