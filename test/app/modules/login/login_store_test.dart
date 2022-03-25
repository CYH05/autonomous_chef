import 'package:autonomous_chef/app/modules/login/domain/entities/login_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/login/domain/entities/mock.dart';
import 'package:autonomous_chef/app/modules/login/domain/helpers/exception/mock.dart';
import 'package:autonomous_chef/app/modules/login/domain/usecases/login_email_password/login_email_password_usecase_interface.dart';
import 'package:autonomous_chef/app/modules/login/login_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

class UsecaseMock extends Mock implements ILoginEmailPasswordUsecase {}

class EntityFake extends Fake implements LoginEmailPasswordEntity {}

void main() {
  late ILoginEmailPasswordUsecase _usecase;
  late LoginStore _store;
  late LoginEmailPasswordEntityMock _entity;

  setUp(() {
    _usecase = UsecaseMock();
    _store = LoginStore(usecase: _usecase);
    _entity = LoginEmailPasswordEntityMock();
    registerFallbackValue(EntityFake());
  });

  storeTest(
    'LoginStore should return Right when usecase work normally',
    build: () {
      when(() => _usecase(any())).thenAnswer((_) async => Right(EntityFake()));
      return _store;
    },
    act: (_) async => await _store.loginEmailPassword(
      email: _entity.entityValid.email,
      password: _entity.entityValid.password,
    ),
    expect: () => [tripleLoading, tripleState, tripleLoading],
  );

  storeTest(
    'LoginStore should return Left when usecase call function that throw an EmailOrPasswordInvalidException',
    build: () {
      when(() => _usecase(any()))
          .thenAnswer((_) async => Left(EmailOrPasswordInvalidExceptionMock()));
      return _store;
    },
    act: (_) async => await _store.loginEmailPassword(
      email: _entity.entityValid.email,
      password: _entity.entityValid.password,
    ),
    expect: () => [tripleLoading, tripleError, tripleLoading],
  );

  storeTest(
    'LoginStore should return Left when usecase call function that throw an UserNotFoundException',
    build: () {
      when(() => _usecase(any()))
          .thenAnswer((_) async => Left(UserNotFoundExceptionMock()));
      return _store;
    },
    act: (_) async => await _store.loginEmailPassword(
      email: _entity.entityValid.email,
      password: _entity.entityValid.password,
    ),
    expect: () => [tripleLoading, tripleError, tripleLoading],
  );

  storeTest(
    'LoginStore should return Left when usecase call function that throw an UserDisabledException',
    build: () {
      when(() => _usecase(any()))
          .thenAnswer((_) async => Left(UserDisabledExceptionMock()));
      return _store;
    },
    act: (_) async => await _store.loginEmailPassword(
      email: _entity.entityValid.email,
      password: _entity.entityValid.password,
    ),
    expect: () => [tripleLoading, tripleError, tripleLoading],
  );
}
