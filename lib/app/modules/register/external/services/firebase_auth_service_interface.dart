import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';

abstract class IFirebaseAuthService {
  Future<RegisterEmailPasswordEntity> registerFirebaseAuth(
    Map<String, dynamic> map,
  );
}
