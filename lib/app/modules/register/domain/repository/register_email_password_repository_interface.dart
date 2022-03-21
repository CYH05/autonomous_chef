import 'package:fpdart/fpdart.dart';
import '../../../../core/helpers/app_exception.dart';
import '../entity/register_email_password_entity.dart';

abstract class IRegisterEmailPasswordRepository {
  Future<Either<IAppException, RegisterEmailPasswordEntity>>
      registerWithEmailPassword(RegisterEmailPasswordEntity entity);
}
