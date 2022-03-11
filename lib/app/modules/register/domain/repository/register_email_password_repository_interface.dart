import 'package:fpdart/fpdart.dart';
import '../../../../core/helpers/app_exceptions.dart';
import '../entity/register_email_password_entity.dart';

abstract class IRegisterEmailPasswordRepository {
  Future<Either<IAppExceptions, RegisterEmailPasswordEntity>>
      registerWithEmailPassword(
    RegisterEmailPasswordEntity entity,
  );
}
