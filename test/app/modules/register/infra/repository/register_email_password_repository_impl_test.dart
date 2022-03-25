import 'package:autonomous_chef/app/modules/register/domain/entity/mock.dart';
import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exception/exception.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exception/mock.dart';
import 'package:autonomous_chef/app/modules/register/domain/repository/register_email_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/register/infra/datasource/register_email_password_datasource_interface.dart';
import 'package:autonomous_chef/app/modules/register/infra/mappers/register_email_password_entity_mapper.dart';
import 'package:autonomous_chef/app/modules/register/infra/repository/register_email_password_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockDatasource extends Mock implements IRegisterEmailPasswordDatasource {}

void main() {
  late MockDatasource _mockDatasource;
  late IRegisterEmailPasswordRepository _repository;
  late RegisterEmailPasswordMock _entityMock;

  setUp(() {
    _mockDatasource = MockDatasource();
    _repository = RegisterEmailPasswordRepositoryImpl(_mockDatasource);
    _entityMock = RegisterEmailPasswordMock();
  });
  test(
    'RegisterEmailPasswordRepositoryImpl, should return right when datasource work without any exception.',
    () async {
      when((() => _mockDatasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(_entityMock.entityValid))))
          .thenAnswer((_) async => unit);

      final response =
          await _repository.registerWithEmailPassword(_entityMock.entityValid);

      final result = response.fold(id, id);
      expect(result, isA<RegisterEmailPasswordEntity>());
    },
  );

  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw EmailAlreadyInUseException.',
    () async {
      when((() => _mockDatasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(_entityMock.entityValid))))
          .thenThrow(EmailAlreadyInUseExceptionMock());

      final response =
          await _repository.registerWithEmailPassword(_entityMock.entityValid);

      final result = response.fold(id, id);
      expect(result, isA<EmailAlreadyInUseException>());
    },
  );

  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw FirebaseAuthCouldNotRegisterException.',
    () async {
      when((() => _mockDatasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(_entityMock.entityValid))))
          .thenThrow(EmailOrPasswordEnabledExceptionMock());

      final response =
          await _repository.registerWithEmailPassword(_entityMock.entityValid);

      final result = response.fold(id, id);
      expect(result, isA<EmailOrPasswordEnabledException>());
    },
  );
  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw InvalidEmailException.',
    () async {
      when((() => _mockDatasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(_entityMock.entityValid))))
          .thenThrow(InvalidEmailExceptionMock());

      final response =
          await _repository.registerWithEmailPassword(_entityMock.entityValid);

      final result = response.fold(id, id);
      expect(result, isA<InvalidEmailException>());
    },
  );

  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw WeekPasswordException.',
    () async {
      when(
        (() => _mockDatasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(
                _entityMock.entityWeekPassword,
              ),
            )),
      ).thenThrow(WeekPasswordExceptionMock());

      final response = await _repository.registerWithEmailPassword(
        _entityMock.entityWeekPassword,
      );

      final result = response.fold(id, id);
      expect(result, isA<WeekPasswordException>());
    },
  );
}
