import 'package:autonomous_chef/app/modules/reset-password/domain/entities/email_reset_password_entity.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/entities/mock.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/helpers/exception/exception.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/helpers/exception/mock.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/repository/email_reset_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/reset-password/infra/datasource/email_reset_password_datasource_interface.dart';
import 'package:autonomous_chef/app/modules/reset-password/infra/repository/email_reset_password_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class DatasourceMock extends Mock implements IEmailResetPasswordDatasource {}

void main() {
  late IEmailResetPasswordDatasource _datasource;
  late IEmailResetPasswordRepository _repository;
  late EmailResetPasswordEntityMock _entity;

  setUp(() {
    _datasource = DatasourceMock();
    _repository = EmailResetPasswordRepositoryImpl(_datasource);
    _entity = EmailResetPasswordEntityMock();
  });
  test(
    'EmailResetPasswordRepositoryImpl should return right when datasource work without failure.',
    () async {
      when(() => _datasource.sendEmailResetPassword(_entity.entityValid))
          .thenAnswer((_) async => unit);

      final response =
          await _repository.sendEmailResetPassword(_entity.entityValid);

      final result = response.fold(id, id);

      expect(result, isA<EmailResetPasswordEntity>());
    },
  );

  test(
    'EmailResetPasswordRepositoryImpl should return left when datasource throw InvalidEmailException.',
    () async {
      when(() => _datasource.sendEmailResetPassword(_entity.entityValid))
          .thenThrow(InvalidEmailExceptionMock());

      final response =
          await _repository.sendEmailResetPassword(_entity.entityValid);

      final result = response.fold(id, id);

      expect(result, isA<InvalidEmailException>());
    },
  );

  test(
    'EmailResetPasswordRepositoryImpl should return left when datasource throw MissingAndroidPackageNameException.',
    () async {
      when(() => _datasource.sendEmailResetPassword(_entity.entityValid))
          .thenThrow(MissingAndroidPackageNameExceptionMock());

      final response =
          await _repository.sendEmailResetPassword(_entity.entityValid);

      final result = response.fold(id, id);

      expect(result, isA<MissingAndroidPackageNameException>());
    },
  );

  test(
    'EmailResetPasswordRepositoryImpl should return left when datasource throw MissingContinueURIException.',
    () async {
      when(() => _datasource.sendEmailResetPassword(_entity.entityValid))
          .thenThrow(MissingContinueURIExceptionMock());

      final response =
          await _repository.sendEmailResetPassword(_entity.entityValid);

      final result = response.fold(id, id);

      expect(result, isA<MissingContinueURIException>());
    },
  );

  test(
    'EmailResetPasswordRepositoryImpl should return left when datasource throw MissingIOSBundleIdException.',
    () async {
      when(() => _datasource.sendEmailResetPassword(_entity.entityValid))
          .thenThrow(MissingIOSBundleIdExceptionMock());

      final response =
          await _repository.sendEmailResetPassword(_entity.entityValid);

      final result = response.fold(id, id);

      expect(result, isA<MissingIOSBundleIdException>());
    },
  );

  test(
    'EmailResetPasswordRepositoryImpl should return left when datasource throw InvalidContinueURIException.',
    () async {
      when(() => _datasource.sendEmailResetPassword(_entity.entityValid))
          .thenThrow(InvalidContinueURIExceptionMock());

      final response =
          await _repository.sendEmailResetPassword(_entity.entityValid);

      final result = response.fold(id, id);

      expect(result, isA<InvalidContinueURIException>());
    },
  );

  test(
    'EmailResetPasswordRepositoryImpl should return left when datasource throw UnauthorizedContinueURIException.',
    () async {
      when(() => _datasource.sendEmailResetPassword(_entity.entityValid))
          .thenThrow(UnauthorizedContinueURIExceptionMock());

      final response =
          await _repository.sendEmailResetPassword(_entity.entityValid);

      final result = response.fold(id, id);

      expect(result, isA<UnauthorizedContinueURIException>());
    },
  );

  test(
    'EmailResetPasswordRepositoryImpl should return left when datasource throw UserNotFoundException.',
    () async {
      when(() => _datasource.sendEmailResetPassword(_entity.entityValid))
          .thenThrow(UserNotFoundExceptionMock());

      final response =
          await _repository.sendEmailResetPassword(_entity.entityValid);

      final result = response.fold(id, id);

      expect(result, isA<UserNotFoundException>());
    },
  );
}
