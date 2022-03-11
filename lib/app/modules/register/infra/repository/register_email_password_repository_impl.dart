import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exceptions.dart';
import 'package:autonomous_chef/app/modules/register/infra/mapers/register_email_password_entity_mapers.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/helpers/app_exceptions.dart';
import '../../domain/repository/register_email_password_repository_interface.dart';
import '../datasource/register_email_password_datasource_interface.dart';

class RegisterEmailPasswordRepositoryImpl
    implements IRegisterEmailPasswordRepository {
  final IRegisterEmailPasswordDatasource _datasource;

  RegisterEmailPasswordRepositoryImpl(this._datasource);

  @override
  Future<Either<IAppExceptions, RegisterEmailPasswordEntity>>
      registerWithEmailPassword(
    RegisterEmailPasswordEntity entity,
  ) async {
    try {
      final registerMap = RegisterEmailPasswordMaper(
        email: entity.email,
        password: entity.password,
      );
      final registerEmailPasswordMaper =
          await _datasource.registerEmailPassword(registerMap.toMap());
      return Right(registerEmailPasswordMaper);
    } on EmailAlreadyInUseException catch (_, exception) {
      return Left(
        EmailAlreadyInUseException(
          message: "Este email já esta sendo utilizado.",
          stackTrace: exception,
        ),
      );
    } on FirebaseAuthCouldNotRegisterException catch (_, exception) {
      return Left(
        FirebaseAuthCouldNotRegisterException(
          //TODO trocar a mensagem
          message: "Houve uma falha no serviço externo(firebase)",
          stackTrace: exception,
        ),
      );
    }
  }
}
