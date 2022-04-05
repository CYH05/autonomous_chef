import 'package:mocktail/mocktail.dart';

import 'exception.dart';

class InvalidEmailMock extends Mock implements InvalidEmail {}

class MissingAndroidPackageNameMock extends Mock
    implements MissingAndroidPackageName {}

class MissingContinueURIMock extends Mock implements MissingContinueURI {}

class MissingIOSBundleIdMock extends Mock implements MissingIOSBundleId {}

class InvalidContinueURIMock extends Mock implements InvalidContinueURI {}

class UnauthorizedContinueURIMock extends Mock
    implements UnauthorizedContinueURI {}

class UserNotFoundMock extends Mock implements UserNotFound {}
