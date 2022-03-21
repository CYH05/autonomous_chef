import 'package:autonomous_chef/app/modules/register/domain/helpers/error/error.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/helpers/app_exception.dart';
import '../../entity/register_email_password_entity.dart';
import '../../helpers/validator/validator.dart';
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
        EmailValidationError(
          message: "Preencha com um endereço de e-mail válido.",
        ),
      );
    }
    if (!validatePassword(registerEntity.password)) {
      return const Left(
        PasswordValidationError(
          message:
              "Sua senha deve conter ao menos:\n8 caracteres;\n1 caractere minusculo;\n1 caractere maisculo;\n1 múmero;\n1 caractere especial.",
        ),
      );
    }

    return _repository.registerWithEmailPassword(registerEntity);
  }
}
