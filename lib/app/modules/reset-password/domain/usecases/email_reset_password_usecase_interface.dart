import 'package:autonomous_chef/app/core/helpers/app_exception.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/entities/email_reset_password_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class IEmailResetPasswordUsecase {
  Future<Either<IAppException, EmailResetPasswordEntity>> call(EmailResetPasswordEntity entity);
}
