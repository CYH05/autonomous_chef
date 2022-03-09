import 'package:fpdart/fpdart.dart';
import '../entity/register_email_password_entity.dart';

abstract class IRegisterEmailPasswordRepository {
  Future<Either<Exception, RegisterEmailPassword>> registerWithemailPassword(
      RegisterEmailPassword entity);
}
