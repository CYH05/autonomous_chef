import 'package:autonomous_chef/app/modules/register/external/services/firebase_auth_service_interface.dart';
import 'package:autonomous_chef/app/modules/register/infra/datasource/register_email_password_datasource_interface.dart';
import 'package:fpdart/fpdart.dart';

class RegisterEmailPasswordDatasourceImpl
    implements IRegisterEmailPasswordDatasource {
  final IFirebaseAuthService _service;

  const RegisterEmailPasswordDatasourceImpl(
      {required IFirebaseAuthService service})
      : _service = service;

  @override
  Future<Unit> registerEmailPassword(
    Map<String, dynamic> registerEmailPasswordMap,
  ) async {
    await _service.registerFirebaseAuth(registerEmailPasswordMap);

    return unit;
  }
}
