import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';

abstract class IRegisterEmailPasswordDatasource {
  Future<RegisterEmailPasswordEntity> registerEmailPassword(
    Map<String, dynamic> registerEmailPasswordMap,
  );
}
