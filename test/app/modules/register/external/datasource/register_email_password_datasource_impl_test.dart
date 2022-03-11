import 'package:autonomous_chef/app/modules/register/domain/helpers/exceptions.dart';
import 'package:autonomous_chef/app/modules/register/external/datasource/register_email_password_datasource_impl.dart';
import 'package:autonomous_chef/app/modules/register/external/responses.dart';
import 'package:autonomous_chef/app/modules/register/external/services/firebase_auth_service_interface.dart';
import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockService extends Mock implements IFirebaseAuthService {}

void main() {
  late final MockService _service;
  late final RegisterEmailPasswordDatasourceImpl _datasource;

  setUp(() {
    _service = MockService();
    _datasource = RegisterEmailPasswordDatasourceImpl(_service);
  });
  test(
    'RegisterEmailPasswordDatasourceImpl, should return RegisterEmailPasswordEntity when service work normally',
    () async {
      final Map<String, dynamic> registerEmailPasswordMap = {
        "email": "teste@teste.teste",
        "password": "Teste@123",
      };

      when(() => _service.registerFirebaseAuth(registerEmailPasswordMap))
          .thenAnswer(
        (_) async => SuccessResponse(
          message: "Work as espected",
          status: true,
        ),
      );

      final result = await _datasource.registerEmailPassword(
        registerEmailPasswordMap,
      );

      expect(result, isA<RegisterEmailPasswordEntity>());
    },
  );

  test(
    'RegisterEmailPasswordDatasourceImpl, should throw EmailAlreadyInUseException when email addres is already in our database',
    () async {
      final Map<String, dynamic> registerEmailPasswordMap = {
        "email": "teste@teste.teste",
        "password": "Teste@123",
      };

      when(() => _service.registerFirebaseAuth(registerEmailPasswordMap))
          .thenAnswer(
        (_) async => throw EmailAlreadyInUseException(
          message: "Este email já esta sendo utilizado.",
          stackTrace: StackTrace.fromString("stackTraceMessage"),
        ),
      );

      expect(
        () async => await _datasource.registerEmailPassword(
          registerEmailPasswordMap,
        ),
        throwsA(
          isA<EmailAlreadyInUseException>(),
        ),
      );
    },
  );

}
