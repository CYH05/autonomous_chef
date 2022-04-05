import 'package:autonomous_chef/app/modules/reset-password/domain/entities/mock.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/repository/email_reset_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/usecases/email_reset_password_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements IEmailResetPasswordRepository {}

void main() {
  late RepositoryMock _repository;
  late EmailResetPasswordUsecaseImpl _usecase;
  late EmailResetPasswordEntityMock _entity;

  setUp(() {
    _repository = RepositoryMock();
    _usecase = EmailResetPasswordUsecaseImpl(_repository);
    _entity = EmailResetPasswordEntityMock();
  });
  test(
    'EmailResetPasswordUsecaseImpl should return Right when repository work normally',
    () async {
      when(() => _repository.sendEmailResetPassword(_entity.entityValid))
          .thenAnswer((_) async => Right(_entity.entityValid));

      final response = await _usecase(_entity.entityValid);

      final result = response.fold(id, id);

      expect(result, _entity.entityValid);
    },
  );

  test(
    'EmailResetPasswordUsecaseImpl should return Left when the email is not valid',
    () async {
      final response = await _usecase(_entity.entityInvalid);

      expect(response, isA<Left>());
    },
  );
}
