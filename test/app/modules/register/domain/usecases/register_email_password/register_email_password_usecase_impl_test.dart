import 'package:autonomous_chef/app/modules/register/domain/entity/mock.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/error/error.dart';
import 'package:autonomous_chef/app/modules/register/domain/repository/register_email_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/register/domain/usecases/register_email_password/register_email_password_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockRepo extends Mock implements IRegisterEmailPasswordRepository {}

void main() {
  late IRegisterEmailPasswordRepository _mockRepo;
  late RegisterEmailPasswordUsecaseImpl _usecase;
  late RegisterEmailPasswordMock _entityMock;

  setUp(() {
    _mockRepo = MockRepo();
    _usecase = RegisterEmailPasswordUsecaseImpl(_mockRepo);
    _entityMock = RegisterEmailPasswordMock();
  });
  test(
    'RegisterEmailPasswordUsecaseImpl should Return right, when email and password is valid and the repository work normally',
    () async {
      when(() => _mockRepo.registerWithEmailPassword(_entityMock.entityValid))
          .thenAnswer((_) async => Right(_entityMock.entityValid));

      final response = await _usecase(_entityMock.entityValid);

      /*
      De forma abreviada
      testUseCase.fold((l) => l, (r) => r); 
      Gera o mesmo resultado do expect abaixo
      
      final result = response.fold(id, id);
      expect(result, isA<RegisterEmailPasswordEntity>()); */
      expect(response.isRight(), equals(true));
    },
  );

  test(
    'RegisterEmailPasswordUsecaseImpl should return Left, when email is invalid.',
    () async {
      final response = await _usecase(_entityMock.entityInvalidEmail);

      final result = response.fold(id, id);

      expect(result, isA<EmailValidationError>());
    },
  );

  test(
    'RegisterEmailPasswordUsecaseImpl should return Left, when password is invalid.',
    () async {
      final response = await _usecase(_entityMock.entityInvalidPassword);

      final result = response.fold(id, id);

      expect(result, isA<PasswordValidationError>());
    },
  );
}
