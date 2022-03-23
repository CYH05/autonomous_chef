import 'package:fpdart/fpdart.dart';

import '../entities/login_email_password_entity.dart';

abstract class ILoginEmailPasswordRepositoy {
  // TODO qnd a pull request for aceita trocar essa exception para a IAppException
  Future<Either<Exception, LoginEmailPasswordentity>> loginWithEmailPassword();
}
