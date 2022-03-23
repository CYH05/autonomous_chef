import 'package:autonomous_chef/app/modules/login/domain/entities/login_email_password_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ILoginEmailPasswordUsecase {
  // TODO qnd a pull request for aceita trocar essa exception para a IAppException
  Future<Either<Exception, LoginEmailPasswordentity>> call();
}
