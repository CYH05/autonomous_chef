import 'package:fpdart/fpdart.dart';

import '../../entity/register_email_password_entity.dart';
import '../../helpers/exceptions.dart';
import '../../helpers/validators.dart';
import '../../repository/register_email_password_repository_interface.dart';
import '../interfaces/register_email_password_usecase_interface.dart';

class RegisterEmailPasswordUsecaseImpl
    implements IRegisterEmailPasswordUsecase {
  final IRegisterEmailPasswordRepository _repository;

  RegisterEmailPasswordUsecaseImpl(this._repository);
  @override
  Future<Either<RegisterException, RegisterEmailPasswordEntity>> call(
    RegisterEmailPasswordEntity registerEntity,
  ) async {
    if (!validateEmail(registerEntity.email)) {
      return Left(
        EmailAddressInvalidException(
          message: "Preencha com um endereço de e-mail válido.",
        ),
      );
    }
    if (!validatePassword(registerEntity.password)) {
      return Left(
        PasswordInvalidException(
          message:
              "Sua senha deve conter ao menos:\n8 caracteres;\n1 caractere minusculo;\n1 caractere maisculo;\n1 múmero;\n1 caractere especial.",
        ),
      );
    }

    return _repository.registerWithEmailPassword(registerEntity);
  }
}
