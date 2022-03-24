import 'package:autonomous_chef/app/modules/register/domain/entity/mock.dart';
import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exception/exception.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exception/mock.dart';
import 'package:autonomous_chef/app/modules/register/domain/repository/register_email_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/register/infra/datasource/register_email_password_datasource_interface.dart';
import 'package:autonomous_chef/app/modules/register/infra/mapper/register_email_password_entity_mapper.dart';
import 'package:autonomous_chef/app/modules/register/infra/repository/register_email_password_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockDatasource extends Mock implements IRegisterEmailPasswordDatasource {}

void main() {
  late MockDatasource _datasource;
  late IRegisterEmailPasswordRepository _repository;
  late ExceptionMock _exception;
  late RegisterEmailPasswordMock _entity;

  setUp(() {
    _datasource = MockDatasource();
    _repository = RegisterEmailPasswordRepositoryImpl(_datasource);
    _exception = ExceptionMock();
    _entity = RegisterEmailPasswordMock();
  });
  test(
    'RegisterEmailPasswordRepositoryImpl, should return right when datasource work without any exception.',
    () async {
      when((() => _datasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(_entity.entityValid))))
          .thenAnswer((_) async => unit);

      final response =
          await _repository.registerWithEmailPassword(_entity.entityValid);

      final result = response.fold(id, id);
      expect(result, isA<RegisterEmailPasswordEntity>());
    },
  );

  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw EmailAlreadyInUseException.',
    () async {
      when((() => _datasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(_entity.entityValid))))
          .thenThrow(_exception.emailAlreadyInUseException);

      final response =
          await _repository.registerWithEmailPassword(_entity.entityValid);

      final result = response.fold(id, id);
      expect(result, isA<EmailAlreadyInUseException>());
    },
  );

  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw FirebaseAuthCouldNotRegisterException.',
    () async {
      when((() => _datasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(_entity.entityValid))))
          .thenThrow(_exception.emailOrPasswordEnabledException);

      final response =
          await _repository.registerWithEmailPassword(_entity.entityValid);

      final result = response.fold(id, id);
      expect(result, isA<EmailOrPasswordEnabledException>());
    },
  );
  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw InvalidEmailException.',
    () async {
      when((() => _datasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(_entity.entityValid))))
          .thenThrow(_exception.invalidEmailException);

      final response =
          await _repository.registerWithEmailPassword(_entity.entityValid);

      final result = response.fold(id, id);
      expect(result, isA<InvalidEmailException>());
    },
  );

  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw WeekPasswordException.',
    () async {
      when(
        (() => _datasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(
                _entity.entityWeekPassword,
              ),
            )),
      ).thenThrow(_exception.weekPasswordException);

      final response = await _repository.registerWithEmailPassword(
        _entity.entityWeekPassword,
      );

      final result = response.fold(id, id);
      expect(result, isA<WeekPasswordException>());
    },
  );
}
