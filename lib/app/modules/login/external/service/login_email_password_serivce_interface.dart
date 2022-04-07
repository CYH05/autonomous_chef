import 'package:autonomous_chef/app/modules/login/domain/entities/login_email_password_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ILoginEmailPasswordService {
  Future<Unit> loginEmailPassword(LoginEmailPasswordEntity entity);
}
