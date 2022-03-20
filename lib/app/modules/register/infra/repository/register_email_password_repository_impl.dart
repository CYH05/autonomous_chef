import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exceptions.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/helpers/app_exception.dart';
import '../../domain/repository/register_email_password_repository_interface.dart';
import '../datasource/register_email_password_datasource_interface.dart';
import '../mappers/register_email_password_entity_mapper.dart';

class RegisterEmailPasswordRepositoryImpl
    implements IRegisterEmailPasswordRepository {
  final IRegisterEmailPasswordDatasource _datasource;

  const RegisterEmailPasswordRepositoryImpl(this._datasource);

  @override
  Future<Either<IAppException, RegisterEmailPasswordEntity>>
      registerWithEmailPassword(
    RegisterEmailPasswordEntity entity,
  ) async {
    try {
      final registerMap = RegisterEmailPasswordMapper(
        email: entity.email,
        password: entity.password,
      );
      final registerEmailPasswordMaper =
          await _datasource.registerEmailPassword(
        RegisterEmailPasswordMapper.toMap(registerMap),
      );
      return Right(registerEmailPasswordMaper);
    } on EmailAlreadyInUseException catch (_, exception) {
      return Left(
        EmailAlreadyInUseException(
          message: "Este email já esta sendo utilizado.",
          stackTrace: exception,
        ),
      );
    } on EmailOrPasswordEnabledException catch (_, exception) {
      return Left(
        EmailOrPasswordEnabledException(
          message:
              "Email ou senha estão desabilitados, habilite a opção no console do firebase.",
          stackTrace: exception,
        ),
      );
    } on InvalidEmailException catch (_, exception) {
      return Left(
        InvalidEmailException(
          message: "Endereço de email inválida.",
          stackTrace: exception,
        ),
      );
    } on WeekPasswordException catch (_, exception) {
      return Left(
        WeekPasswordException(
          message: "A senha é considerada muito fraca.",
          stackTrace: exception,
        ),
      );
    }
  }
}
