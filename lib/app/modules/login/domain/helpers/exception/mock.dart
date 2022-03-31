import 'package:mocktail/mocktail.dart';

import 'exception.dart';

class EmailOrPasswordInvalidExceptionMock extends Mock
    implements EmailOrPasswordInvalidException {}

class UserNotFoundExceptionMock extends Mock implements UserNotFoundException {}

class UserDisabledExceptionMock extends Mock implements UserDisabledException {}
