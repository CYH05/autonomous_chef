import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exceptions.dart';
import 'package:autonomous_chef/app/modules/register/infra/datasource/register_email_password_datasource_interface.dart';
import 'package:autonomous_chef/app/modules/register/infra/mapers/register_email_password_entity_mapers.dart';
import 'package:autonomous_chef/app/modules/register/infra/repository/register_email_password_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDatasource extends Mock implements IRegisterEmailPasswordDatasource {}

void main() {
  late MockDatasource mockDatasource;
  late RegisterEmailPasswordRepositoryImpl registerEmailPasswordRepositoryImpl;

  setUp(() {
    mockDatasource = MockDatasource();
    registerEmailPasswordRepositoryImpl =
        RegisterEmailPasswordRepositoryImpl(mockDatasource);
  });
  test(
    'RegisterEmailPasswordRepositoryImpl, should return right when datasource work without any exception.',
    () async {
      const registerEntity = RegisterEmailPasswordEntity(
        email: "teste@teste.teste",
        password: "Teste@123",
      );

      final registerMap = RegisterEmailPasswordMaper(
        email: registerEntity.email,
        password: registerEntity.password,
      );

      when((() => mockDatasource.registerEmailPassword(registerMap.toMap())))
          .thenAnswer((_) async => registerEntity);
      //TODO
      final response = await registerEmailPasswordRepositoryImpl
          .registerWithEmailPassword(registerEntity);

      final result = response.fold((l) => l, (r) => r);
      expect(result, isA<RegisterEmailPasswordEntity>());
    },
  );

  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw EmailAlreadyInUseException.',
    () async {
      const registerEntity = RegisterEmailPasswordEntity(
        email: "teste@teste.teste",
        password: "Teste@123",
      );
      final registerMap = RegisterEmailPasswordMaper(
        email: registerEntity.email,
        password: registerEntity.password,
      );

      when((() => mockDatasource.registerEmailPassword(registerMap.toMap())))
          .thenAnswer((_) async {
        throw EmailAlreadyInUseException(
          message: "Este email já esta sendo utilizado.",
          stackTrace: StackTrace.fromString(
            "Este email já esta sendo utilizado.",
          ),
        );
      });

      final response = await registerEmailPasswordRepositoryImpl
          .registerWithEmailPassword(registerEntity);

      final result = response.fold((l) => l, (r) => r);
      expect(result, isA<EmailAlreadyInUseException>());
    },
  );

  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw FirebaseAuthCouldNotRegisterException.',
    () async {
      const registerEntity = RegisterEmailPasswordEntity(
        email: 'teste@teste.teste',
        password: 'Teste@123',
      );
      final registerMap = RegisterEmailPasswordMaper(
        email: "teste@teste.teste",
        password: "Teste@123",
      );

      when((() => mockDatasource.registerEmailPassword(registerMap.toMap())))
          .thenAnswer((_) async {
        throw FirebaseAuthCouldNotRegisterException(
          message: "Algo inesperado ocorreu.",
          stackTrace: StackTrace.fromString(
            "Este email já esta sendo utilizado.",
          ),
        );
      });

      final response = await registerEmailPasswordRepositoryImpl
          .registerWithEmailPassword(registerEntity);

      final result = response.fold((l) => l, (r) => r);
      expect(result, isA<FirebaseAuthCouldNotRegisterException>());
    },
  );
}
