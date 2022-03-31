import 'package:autonomous_chef/app/modules/login/domain/entities/login_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/login/domain/entities/mock.dart';
import 'package:autonomous_chef/app/modules/login/domain/repository/login_email_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/login/domain/usecases/login_email_password/login_email_password_usecase_impl.dart';
import 'package:autonomous_chef/app/modules/login/domain/usecases/login_email_password/login_email_password_usecase_interface.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exception/mock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements ILoginEmailPasswordRepository {}

void main() {
  late ILoginEmailPasswordRepository _repository;
  late LoginEmailPasswordEntityMock _entityMock;
  late ILoginEmailPasswordUsecase _usecase;

  setUp(() {
    _repository = RepositoryMock();
    _entityMock = LoginEmailPasswordEntityMock();
    _usecase = LoginEmailPasswordUsecaseImpl(_repository);
  });
  test(
    'LoginEmailPasswordUsecaseImpl should return Right when email is valid and repository work normally',
    () async {
      when(() => _repository.loginWithEmailPassword(_entityMock.entityValid))
          .thenAnswer((_) async => Right((_entityMock.entityValid)));

      final response = await _usecase(_entityMock.entityValid);

      final result = response.fold(id, id);

      expect(result, isA<LoginEmailPasswordEntity>());
    },
  );

  test(
    "LoginEmailPasswordUsecaseImpl should return Left when email isn't valid.",
    () async {
      when(() => _repository.loginWithEmailPassword(_entityMock.entityInvalid))
          .thenThrow(InvalidEmailExceptionMock());

      final result = await _usecase(_entityMock.entityInvalid);

      expect(result.isLeft(), equals(true));
    },
  );
}
