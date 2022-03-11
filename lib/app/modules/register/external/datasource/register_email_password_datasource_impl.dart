import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/external/services/firebase_auth_service_interface.dart';
import 'package:autonomous_chef/app/modules/register/infra/datasource/register_email_password_datasource_interface.dart';

class RegisterEmailPasswordDatasourceImpl
    implements IRegisterEmailPasswordDatasource {
  final IFirebaseAuthService _service;
  RegisterEmailPasswordDatasourceImpl(this._service);

  @override
  Future<RegisterEmailPasswordEntity> registerEmailPassword(
    Map<String, dynamic> registerEmailPasswordMap,
  ) async {
    await _service.registerFirebaseAuth(
      registerEmailPasswordMap,
    );

    return RegisterEmailPasswordEntity(
      email: registerEmailPasswordMap['email'],
      password: registerEmailPasswordMap['password'],
    );
  }
}
