import 'package:autonomous_chef/app/modules/register/domain/entity/mock.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exception/exception.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exception/mock.dart';
import 'package:autonomous_chef/app/modules/register/external/datasource/register_email_password_datasource_impl.dart';
import 'package:autonomous_chef/app/modules/register/external/services/firebase_auth_service_interface.dart';
import 'package:autonomous_chef/app/modules/register/infra/datasource/register_email_password_datasource_interface.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockService extends Mock implements IFirebaseAuthService {}

void main() {
  late MockService _service;
  late IRegisterEmailPasswordDatasource _datasource;

  late RegisterEmailPasswordMock _entity;

  setUp(() {
    _service = MockService();
    _datasource = RegisterEmailPasswordDatasourceImpl(service: _service);
    _entity = RegisterEmailPasswordMock();
  });
  test(
    'RegisterEmailPasswordDatasourceImpl, should return RegisterEmailPasswordEntity when service work normally',
    () async {
      when(
        () => _service.registerFirebaseAuth(_entity.entityValid),
      ).thenAnswer((_) async => unit);

      final result =
          await _datasource.registerEmailPassword(_entity.entityValid);

      expect(result, isA<Unit>());
    },
  );

  test(
    'RegisterEmailPasswordDatasourceImpl, should throw EmailAlreadyInUseException when email address is already in our database',
    () async {
      when(() => _service.registerFirebaseAuth(_entity.entityValid))
          .thenThrow(EmailAlreadyInUseExceptionMock());

      expect(
        () async =>
            await _datasource.registerEmailPassword(_entity.entityValid),
        throwsA(
          isA<EmailAlreadyInUseException>(),
        ),
      );
    },
  );
}
