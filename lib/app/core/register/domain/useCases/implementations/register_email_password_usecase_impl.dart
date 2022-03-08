import 'package:autonomous_chef/app/core/register/domain/helpers/exceptions.dart';
import 'package:autonomous_chef/app/core/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/core/register/domain/helpers/validators.dart';
import 'package:autonomous_chef/app/core/register/domain/useCases/interfaces/register_email_password_usecase_interface.dart';
import 'package:fpdart/fpdart.dart';

import '../../repository/register_email_password_repository_interface.dart';

class RegisterEmailPasswordUsecaseImpl
    implements IRegisterEmailPasswordUsecase {
  final IRegisterEmailPasswordRepository _repository;

  RegisterEmailPasswordUsecaseImpl(this._repository);
  @override
  Future<Either<InvalidKeysException, RegisterEmailPassword>> call(
      RegisterEmailPassword registerEntity) async {
    if (!validateEmail(registerEntity.email)) {
      return Left(
          InvalidKeysException("Preencha com um endereço de e-mail válido."));
    }
    if (!validatePassword(registerEntity.password)) {
      return Left(InvalidKeysException(
          "Sua senha deve conter ao menos:\n8 caracteres;\n1 caractere minusculo;\n1 caractere maisculo;\n1 múmero;\n1 caractere especial."));
    }
    
    throw UnimplementedError();
  }
}
