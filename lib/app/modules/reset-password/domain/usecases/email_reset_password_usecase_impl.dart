import 'package:autonomous_chef/app/core/helpers/app_exception.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/repository/email_reset_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/usecases/email_reset_password_usecase_interface.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/helpers/validator/email_validator.dart';
import '../../../register/domain/helpers/error/error.dart';
import '../entities/email_reset_password_entity.dart';

class EmailResetPasswordUsecaseImpl implements IEmailResetPasswordUsecase {
  final IEmailResetPasswordRepository _repository;

  const EmailResetPasswordUsecaseImpl(this._repository);

  @override
  Future<Either<IAppException, EmailResetPasswordEntity>> call(
    EmailResetPasswordEntity entity,
  ) async {
    if (!validateEmail(entity.email)) {
      return const Left(
        EmailValidationError(),
      );
    }
    return _repository.sendEmailResetPassword(entity);
  }
}
