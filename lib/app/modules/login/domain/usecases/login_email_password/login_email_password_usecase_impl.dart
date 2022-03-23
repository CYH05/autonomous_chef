import 'package:autonomous_chef/app/modules/login/domain/entities/login_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/login/domain/repository/login_email_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/login/domain/usecases/login_email_password/login_email_password_usecase_interface.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/error/error.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/validator/validator.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/helpers/app_exception.dart';

class LoginEmailPasswordUsecaseImpl implements ILoginEmailPasswordUsecase {
  final ILoginEmailPasswordRepositoy _repository;

  const LoginEmailPasswordUsecaseImpl(this._repository);

  @override
  Future<Either<IAppException, LoginEmailPasswordEntity>> call(
    LoginEmailPasswordEntity entity,
  ) async {
    if (!validateEmail(entity.email)) {
      return const Left(EmailValidationError());
    }
    return _repository.loginWithEmailPassword(entity);
  }
}
