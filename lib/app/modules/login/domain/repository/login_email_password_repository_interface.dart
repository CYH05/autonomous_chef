import 'package:fpdart/fpdart.dart';

import '../../../../core/helpers/app_exception.dart';
import '../entities/login_email_password_entity.dart';

abstract class ILoginEmailPasswordRepositoy {
  Future<Either<IAppException, LoginEmailPasswordEntity>>
      loginWithEmailPassword(LoginEmailPasswordEntity entity);
}
