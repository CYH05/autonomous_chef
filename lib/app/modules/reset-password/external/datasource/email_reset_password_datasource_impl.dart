import 'package:autonomous_chef/app/modules/reset-password/domain/entities/email_reset_password_entity.dart';
import 'package:autonomous_chef/app/modules/reset-password/external/service/email_reset_password_service_interface.dart.dart';
import 'package:autonomous_chef/app/modules/reset-password/infra/datasource/email_reset_password_datasource_interface.dart';
import 'package:fpdart/fpdart.dart';

class EmailResetPasswordDatasourceImpl
    implements IEmailResetPasswordDatasource {
  final IEmailResetPasswordService _service;

  const EmailResetPasswordDatasourceImpl({required service})
      : _service = service;
  @override
  Future<Unit> sendEmailResetPassword(EmailResetPasswordEntity entity) async {
    await _service.sendResetEmail(entity);

    return unit;
  }
}
