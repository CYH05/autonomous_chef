import 'package:fpdart/fpdart.dart';

import '../../../../core/helpers/app_exception.dart';
import '../entities/login_email_password_entity.dart';

abstract class ILoginEmailPasswordRepository {
  Future<Either<IAppException, LoginEmailPasswordEntity>>
      loginWithEmailPassword(LoginEmailPasswordEntity entity);
}
