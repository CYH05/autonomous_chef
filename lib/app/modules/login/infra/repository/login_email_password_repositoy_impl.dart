import 'package:autonomous_chef/app/modules/login/domain/entities/login_email_password_entity.dart';
import 'package:autonomous_chef/app/core/helpers/app_exception.dart';
import 'package:autonomous_chef/app/modules/login/domain/helpers/exception/exception.dart';
import 'package:autonomous_chef/app/modules/login/domain/repository/login_email_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/login/infra/datasource/login_email_password_datasource_interface.dart';
import 'package:autonomous_chef/app/modules/login/infra/mapper/login_email_password_entity_mapper.dart';
import 'package:fpdart/fpdart.dart';

class LoginEmailPasswordRepositoryImpl
    implements ILoginEmailPasswordRepository {
  final ILoginEmailPasswordDatasource _datasource;

  const LoginEmailPasswordRepositoryImpl(this._datasource);

  @override
  Future<Either<IAppException, LoginEmailPasswordEntity>>
      loginWithEmailPassword(LoginEmailPasswordEntity entity) async {
    try {
      await _datasource.loginEmailPassword(entity);
      return Right(entity);
    } on EmailOrPasswordInvalidException catch (_, stackTrace) {
      return Left(EmailOrPasswordInvalidException(stackTrace: stackTrace));
    } on UserNotFoundException catch (_, stackTrace) {
      return Left(UserNotFoundException(stackTrace: stackTrace));
    } on UserDisabledException catch (_, stackTrace) {
      return Left(UserDisabledException(stackTrace: stackTrace));
    }
  }
}
