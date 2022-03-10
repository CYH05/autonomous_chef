import '../../entity/register_email_password_entity.dart';
import '../../helpers/exceptions.dart';
import 'package:fpdart/fpdart.dart';

abstract class IRegisterEmailPasswordUsecase {
  Future<Either<RegisterException, RegisterEmailPasswordEntity>> call(
      RegisterEmailPasswordEntity registerEntity);
}
