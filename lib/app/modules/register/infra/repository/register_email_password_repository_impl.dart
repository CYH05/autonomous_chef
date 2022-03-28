import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exception/exception.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/helpers/app_exception.dart';
import '../../domain/repository/register_email_password_repository_interface.dart';
import '../datasource/register_email_password_datasource_interface.dart';

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
      await _datasource.registerEmailPassword(entity);

      return Right(entity);
    } on EmailAlreadyInUseException catch (_, stackTrace) {
      return Left(
        EmailAlreadyInUseException(
          stackTrace: stackTrace,
        ),
      );
    } on EmailOrPasswordEnabledException catch (_, stackTrace) {
      return Left(
        EmailOrPasswordEnabledException(
          stackTrace: stackTrace,
        ),
      );
    } on InvalidEmailException catch (_, stackTrace) {
      return Left(
        InvalidEmailException(
          stackTrace: stackTrace,
        ),
      );
    } on WeekPasswordException catch (_, stackTrace) {
      return Left(
        WeekPasswordException(
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
