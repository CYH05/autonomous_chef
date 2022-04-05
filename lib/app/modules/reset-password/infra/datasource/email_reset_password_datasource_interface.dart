import 'package:autonomous_chef/app/modules/reset-password/domain/entities/email_reset_password_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class IEmailResetPasswordDatasource {
  Future<Unit> sendEmailResetPassword(EmailResetPasswordEntity entity);
}
