import 'package:autonomous_chef/app/modules/reset-password/domain/entities/email_reset_password_entity.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/entities/mock.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/helpers/exception/mock.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/usecases/email_reset_password_usecase_interface.dart';
import 'package:autonomous_chef/app/modules/reset-password/reset_password_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

class UsecaseMock extends Mock implements IEmailResetPasswordUsecase {}

class EntityFake extends Fake implements EmailResetPasswordEntity {}

void main() {
  late IEmailResetPasswordUsecase _usecase;
  late ResetPasswordStore _store;
  late EmailResetPasswordEntityMock _entity;
  late String _email;

  setUp(() {
    _usecase = UsecaseMock();
    _store = ResetPasswordStore(usecase: _usecase);
    _entity = EmailResetPasswordEntityMock();
    _email = _entity.entityValid.email;
    registerFallbackValue(EntityFake());
  });

  storeTest(
    "ResetPasswordStore should change your store status to tripleLoading, tripleState and tripleLoading in order.",
    build: (() {
      when(() => _usecase(any())).thenAnswer((_) async => Right(EntityFake()));
      return _store;
    }),
    act: (_) async => await _store.sendResetPasswordEmail(email: _email),
    expect: () => [tripleLoading, tripleState, tripleLoading],
  );

  storeTest(
    "ResetPasswordStore should change your store status to tripleLoading, tripleError and tripleLoading in order.",
    build: (() {
      when(() => _usecase(any()))
          .thenAnswer((_) async => Left(ResetPasswordExceptionMock()));
      return _store;
    }),
    act: (_) async => await _store.sendResetPasswordEmail(email: _email),
    expect: () => [tripleLoading, tripleError, tripleLoading],
  );
}
