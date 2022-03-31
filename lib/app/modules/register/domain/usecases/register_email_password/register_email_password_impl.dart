import 'package:autonomous_chef/app/modules/register/domain/helpers/error/error.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/helpers/app_exception.dart';
import '../../../../../core/helpers/validator/email_validator.dart';
import '../../../../../core/helpers/validator/password_validator.dart';
import '../../entity/register_email_password_entity.dart';

import '../../repository/register_email_password_repository_interface.dart';
import 'register_email_password_interface.dart';

class RegisterEmailPasswordUsecaseImpl
    implements IRegisterEmailPasswordUsecase {
  final IRegisterEmailPasswordRepository _repository;

  const RegisterEmailPasswordUsecaseImpl(this._repository);
  @override
  Future<Either<IAppException, RegisterEmailPasswordEntity>> call(
    RegisterEmailPasswordEntity registerEntity,
  ) async {
    if (!validateEmail(registerEntity.email)) {
      return const Left(
        EmailValidationError(),
      );
    }
    if (!validatePassword(registerEntity.password)) {
      return const Left(
        PasswordValidationError(),
      );
    }

    return _repository.registerWithEmailPassword(registerEntity);
  }
}
