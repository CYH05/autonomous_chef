import 'package:autonomous_chef/app/core/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/core/register/domain/helpers/exceptions.dart';
import 'package:fpdart/fpdart.dart';

abstract class IRegisterEmailPasswordUsecase {
  Future<Either<InvalidKeysException, RegisterEmailPassword>> call(
      RegisterEmailPassword registerEntity);
}
