import 'package:autonomous_chef/app/modules/login/domain/entities/mock.dart';
import 'package:autonomous_chef/app/modules/login/external/datasource/login_email_password_datasource_impl.dart';
import 'package:autonomous_chef/app/modules/login/external/service/login_email_password_serivce_interface.dart';
import 'package:autonomous_chef/app/modules/login/infra/datasource/login_email_password_datasource_interface.dart';
import 'package:autonomous_chef/app/modules/login/infra/mapper/login_email_password_entity_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class ServiceMock extends Mock implements ILoginEmailPasswordService {}

void main() {
  late LoginEmailPasswordEntityMock _entityMock;
  late ILoginEmailPasswordService _service;
  late ILoginEmailPasswordDatasource _datasource;

  setUp(() {
    _entityMock = LoginEmailPasswordEntityMock();
    _service = ServiceMock();
    _datasource = LoginEmailPassworddatasourceImpl(service: _service);
  });
  test(
    'LoginEmailPasswordDatasourceImpl should return true when service work normally',
    () async {
      final map = LoginEmailPasswordEntityMapper.toMap(_entityMock.entityValid);

      when(() => _service.loginEmailPassword(map))
          .thenAnswer((_) async => unit);

      final result = await _datasource.loginEmailPassword(map);

      expect(result, equals(unit));
    },
  );
}
