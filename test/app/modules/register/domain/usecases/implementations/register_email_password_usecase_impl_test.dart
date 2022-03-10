import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exceptions.dart';
import 'package:autonomous_chef/app/modules/register/domain/repository/register_email_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/register/domain/useCases/implementations/register_email_password_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockRepo extends Mock implements IRegisterEmailPasswordRepository {}

void main() {
  late IRegisterEmailPasswordRepository mockRepo;
  late RegisterEmailPasswordUsecaseImpl usecase;

  setUp(() {
    mockRepo = MockRepo();
    usecase = RegisterEmailPasswordUsecaseImpl(mockRepo);
  });
  test(
    'RegisterEmailPasswordUsecaseImpl should return right, when email and password is valid and the repository work normally',
    () async {
      const registerEntity = RegisterEmailPasswordEntity(
        email: "teste@teste.teste",
        password: "Teste@123",
      );

      when(() => mockRepo.registerWithEmailPassword(registerEntity))
          .thenAnswer((_) async => const Right(registerEntity));

      final response = await usecase(registerEntity);

      /*
      De forma abreviada
      testUseCase.fold((l) => l, (r) => r); */

      /* 
      Gera o mesmo resultado do expect abaixo
      final result = response.fold(id, id);
      expect(result, isA<RegisterEmailPasswordEntity>()); */
      expect(response.isRight(), equals(true));
    },
  );

  test(
    'RegisterEmailPasswordUsecaseImpl should return left, when email is invalid.',
    () async {
      const registerEntity = RegisterEmailPasswordEntity(
        email: "testeteste.teste",
        password: "Teste@123",
      );

      final response = await usecase(registerEntity);

      final result = response.fold(id, id);

      expect(result, isA<EmailAddressInvalidException>());
      expect(response.isLeft(), equals(true));
    },
  );

  test(
    'RegisterEmailPasswordUsecaseImpl should return left, when password is invalid.',
    () async {
      const registerEntity = RegisterEmailPasswordEntity(
        email: "teste@teste.teste",
        password: "teste@123",
      );

      final response = await usecase(registerEntity);

      final result = response.fold(id, id);

      expect(result, isA<PasswordInvalidException>());
      expect(response.isLeft(), equals(true));
    },
  );
}
