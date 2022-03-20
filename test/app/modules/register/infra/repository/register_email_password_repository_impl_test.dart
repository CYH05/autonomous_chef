import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exceptions.dart';
import 'package:autonomous_chef/app/modules/register/infra/datasource/register_email_password_datasource_interface.dart';
import 'package:autonomous_chef/app/modules/register/infra/mappers/register_email_password_entity_mapper.dart';
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

      final registerMap = RegisterEmailPasswordMapper(
        email: registerEntity.email,
        password: registerEntity.password,
      );

      when((() => mockDatasource.registerEmailPassword(RegisterEmailPasswordMapper.toMap(registerEntity))))
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
      final registerMap = RegisterEmailPasswordMapper(
        email: registerEntity.email,
        password: registerEntity.password,
      );

      when((() => mockDatasource.registerEmailPassword(RegisterEmailPasswordMapper.toMap(registerEntity))))
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
      final registerMap = RegisterEmailPasswordMapper(
        email: registerEntity.email,
        password: registerEntity.password,
      );

      when((() => mockDatasource.registerEmailPassword(RegisterEmailPasswordMapper.toMap(registerEntity))))
          .thenAnswer((_) async {
        throw EmailOrPasswordEnabledException(
          message: "Algo inesperado ocorreu.",
          stackTrace: StackTrace.fromString(
            "Este email já esta sendo utilizado.",
          ),
        );
      });

      final response = await registerEmailPasswordRepositoryImpl
          .registerWithEmailPassword(registerEntity);

      final result = response.fold((l) => l, (r) => r);
      expect(result, isA<EmailOrPasswordEnabledException>());
    },
  );
  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw InvalidEmailException.',
    () async {
      const registerEntity = RegisterEmailPasswordEntity(
        email: 'testetesteteste',
        password: 'Teste@123',
      );
      final registerMap = RegisterEmailPasswordMapper(
        email: registerEntity.email,
        password: registerEntity.password,
      );

      when((() => mockDatasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(registerEntity))))
          .thenAnswer((_) async {
        throw InvalidEmailException(
          message: "Email inválido.",
          stackTrace: StackTrace.fromString(
            "Informe um endereço de email válido.",
          ),
        );
      });

      final response = await registerEmailPasswordRepositoryImpl
          .registerWithEmailPassword(registerEntity);

      final result = response.fold((l) => l, (r) => r);
      expect(result, isA<InvalidEmailException>());
    },
  );

  test(
    'RegisterEmailPasswordRepositoryImpl, should return left when datasource throw WeekPasswordException.',
    () async {
      const registerEntity = RegisterEmailPasswordEntity(
        email: 'testetesteteste',
        password: 'teste',
      );
      final registerMap = RegisterEmailPasswordMapper(
        email: registerEntity.email,
        password: registerEntity.password,
      );

      when((() => mockDatasource.registerEmailPassword(
              RegisterEmailPasswordMapper.toMap(registerEntity))))
          .thenAnswer((_) async {
        throw WeekPasswordException(
          message: "Senha fraca.",
          stackTrace: StackTrace.fromString(
            "Aumente a complexidade da sua senha.",
          ),
        );
      });

      final response = await registerEmailPasswordRepositoryImpl
          .registerWithEmailPassword(registerEntity);

      final result = response.fold((l) => l, (r) => r);
      expect(result, isA<WeekPasswordException>());
    },
  );
}
