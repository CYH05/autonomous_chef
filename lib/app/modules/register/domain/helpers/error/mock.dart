import 'package:mocktail/mocktail.dart';

import 'error.dart';

class EmailValidationErrorMock extends Mock implements EmailValidationError {}

class PasswordValidationErrorMock extends Mock
    implements PasswordValidationError {}

class PasswordCompararissonnErrorMock extends Mock
    implements PasswordCompararissonnError {}
