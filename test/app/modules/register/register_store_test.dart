import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/usecases/register_email_password/register_email_password_interface.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:autonomous_chef/app/modules/register/register_store.dart';

import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

class MockRegisterUsecase extends Mock
    implements IRegisterEmailPasswordUsecase {}

class EntityFake extends Fake implements RegisterEmailPasswordEntity {}

void main() {
  late RegisterStore store;
  late IRegisterEmailPasswordUsecase mockRegisterUsecase;

  setUp(() {
    mockRegisterUsecase = MockRegisterUsecase();
    store = RegisterStore(registerEmailPasswordUsecase: mockRegisterUsecase);
    registerFallbackValue(EntityFake());
  });
//TODO atualizar os inputs feitos a mão
  storeTest<RegisterStore>(
    "RegisterStore, should change your store status to tripleLoading, tripleState and tripleLoading in order.",
    build: () {
      when(() => mockRegisterUsecase(any()))
          .thenAnswer((_) async => Right(EntityFake()));

      return store;
    },
    act: (_) async => await store.registerEmailPassword(
      email: 'teste@teste.teste',
      password: 'Teste@123',
    ),
    expect: () => [tripleLoading, tripleState, tripleLoading],
  );
}
