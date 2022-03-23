import 'package:autonomous_chef/app/core/helpers/app_exception.dart';
import 'package:autonomous_chef/app/modules/login/domain/entities/login_email_password_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ILoginEmailPasswordUsecase {
  Future<Either<IAppException, LoginEmailPasswordEntity>> call(
    LoginEmailPasswordEntity entity,
  );
}
