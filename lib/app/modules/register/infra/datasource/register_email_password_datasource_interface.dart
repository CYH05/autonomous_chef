import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class IRegisterEmailPasswordDatasource {
  Future<Unit> registerEmailPassword(
    RegisterEmailPasswordEntity entity,
  );
}
