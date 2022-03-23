import 'package:autonomous_chef/app/modules/login/domain/entities/login_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/login/domain/entities/mock.dart';
import 'package:autonomous_chef/app/modules/login/domain/repository/login_email_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/login/infra/datasource/login_email_password_datasource_interface.dart';
import 'package:autonomous_chef/app/modules/login/infra/mapper/login_email_password_entity_mapper.dart';
import 'package:autonomous_chef/app/modules/login/infra/repository/login_email_password_repositoy_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class DataSourceMock extends Mock implements ILoginEmailPasswordDatasource {}

void main() {
  late ILoginEmailPasswordDatasource _datasource;
  late LoginEmailPasswordEntityMock _entityMock;
  late ILoginEmailPasswordRepository _repository;

  setUp(() {
    _datasource = DataSourceMock();
    _entityMock = LoginEmailPasswordEntityMock();
    _repository = LoginEmailPasswordRepositoryImpl(_datasource);
  });
  test(
    'LoginEmailPasswordRepositoyImpl should return Right when datasource work without any exceptions',
    () async {
      when(() => _datasource.loginEmailPassword(
              LoginEmailPasswordEntityMapper.toMap(_entityMock.entityValid)))
          .thenAnswer((_) async => true);

      final response =
          await _repository.loginWithEmailPassword(_entityMock.entityValid);

      final result = response.fold(id, id);

      expect(result, isA<LoginEmailPasswordEntity>());
    },
  );
  //TODO Fazer teste para as exceptions
}
