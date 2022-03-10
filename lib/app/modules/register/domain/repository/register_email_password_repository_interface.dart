import 'package:fpdart/fpdart.dart';
import '../entity/register_email_password_entity.dart';
import '../helpers/exceptions.dart';

abstract class IRegisterEmailPasswordRepository {
  Future<Either<RegisterException, RegisterEmailPasswordEntity>>
      registerWithEmailPassword(RegisterEmailPasswordEntity entity);
}
