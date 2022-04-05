import 'package:autonomous_chef/app/modules/reset-password/domain/entities/email_reset_password_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/helpers/app_exception.dart';

abstract class IEmailResetPasswordRepository{
    Future<Either<IAppException, EmailResetPasswordEntity>>
      sendEmailResetPassword(EmailResetPasswordEntity entity);
}