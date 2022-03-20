import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/useCases/interfaces/register_email_password_usecase_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:autonomous_chef/app/modules/register/register_store.dart';

import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

class MockRegisterUsecase extends Mock
    implements IRegisterEmailPasswordUsecase {}

class EntityFake extends Fake implements RegisterEmailPasswordEntity {}

void main() {
  late final RegisterStore store;
  late final IRegisterEmailPasswordUsecase mockRegisterUsecase;

  setUpAll(() {
    mockRegisterUsecase = MockRegisterUsecase();
    store = RegisterStore(registerEmailPasswordUsecase: mockRegisterUsecase);
    registerFallbackValue(EntityFake());
  });
  storeTest<RegisterStore>(
    "RegisterStore, should change your store status to tripleLoading, tripleState and tripleLoading in order.",
    build: () {
      const registerEntity = RegisterEmailPasswordEntity(
        email: "teste@teste.teste",
        password: "Teste@123",
      );
      when(() => mockRegisterUsecase(any()))
          .thenAnswer((_) async => const Right(registerEntity));

      return store;
    },
    act: (_) async => await store.registerEmailPassword(
      email: 'teste@teste.teste',
      password: 'Teste@123',
    ),
    expect: () => [tripleLoading, tripleState, tripleLoading],
  );
}
