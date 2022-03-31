import 'package:autonomous_chef/app/modules/login/external/service/login_email_password_serivce_interface.dart';
import 'package:autonomous_chef/app/modules/login/infra/datasource/login_email_password_datasource_interface.dart';
import 'package:fpdart/fpdart.dart';

class LoginEmailPasswordDatasourceImpl
    implements ILoginEmailPasswordDatasource {
  final ILoginEmailPasswordService _service;

  const LoginEmailPasswordDatasourceImpl({required service})
      : _service = service;

  @override
  Future<Unit> loginEmailPassword(Map<String, dynamic> map) async {
    await _service.loginEmailPassword(map);
    return unit;
  }
}
