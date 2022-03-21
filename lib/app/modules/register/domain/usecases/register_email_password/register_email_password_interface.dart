import '../../../../../core/helpers/app_exception.dart';
import '../../entity/register_email_password_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class IRegisterEmailPasswordUsecase {
  Future<Either<IAppException, RegisterEmailPasswordEntity>> call(
    RegisterEmailPasswordEntity registerEntity,
  );
}
