import 'package:autonomous_chef/app/modules/reset-password/domain/entities/email_reset_password_entity.dart';
import 'package:autonomous_chef/app/core/helpers/app_exception.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/repository/email_reset_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/reset-password/infra/datasource/email_reset_password_datasource_interface.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/helpers/exception/exception.dart';

class EmailResetPasswordRepositoryImpl
    implements IEmailResetPasswordRepository {
  final IEmailResetPasswordDatasource _datasource;

  const EmailResetPasswordRepositoryImpl(this._datasource);

  @override
  Future<Either<IAppException, EmailResetPasswordEntity>>
      sendEmailResetPassword(EmailResetPasswordEntity entity) async {
    try {
      await _datasource.sendEmailResetPassword(entity);

      return Right(entity);
    } on InvalidEmailException catch (_, stackTrace) {
      return Left(
        InvalidEmailException(stackTrace: stackTrace),
      );
    } on MissingAndroidPackageNameException catch (_, stackTrace) {
      return Left(
        MissingAndroidPackageNameException(stackTrace: stackTrace),
      );
    } on MissingContinueURIException catch (_, stackTrace) {
      return Left(
        MissingContinueURIException(stackTrace: stackTrace),
      );
    } on MissingIOSBundleIdException catch (_, stackTrace) {
      return Left(
        MissingIOSBundleIdException(stackTrace: stackTrace),
      );
    } on InvalidContinueURIException catch (_, stackTrace) {
      return Left(
        InvalidContinueURIException(stackTrace: stackTrace),
      );
    } on UnauthorizedContinueURIException catch (_, stackTrace) {
      return Left(
        UnauthorizedContinueURIException(stackTrace: stackTrace),
      );
    } on UserNotFoundException catch (_, stackTrace) {
      return Left(
        UserNotFoundException(stackTrace: stackTrace),
      );
    }
  }
}
