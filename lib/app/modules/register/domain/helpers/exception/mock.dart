import 'package:mocktail/mocktail.dart';

import 'exception.dart';

class EmailAlreadyInUseExceptionMock extends Mock
    implements EmailAlreadyInUseException {}

class InvalidEmailExceptionMock extends Mock implements InvalidEmailException {}

class EmailOrPasswordEnabledExceptionMock extends Mock
    implements EmailOrPasswordEnabledException {}

class WeekPasswordExceptionMock extends Mock implements WeekPasswordException {}
