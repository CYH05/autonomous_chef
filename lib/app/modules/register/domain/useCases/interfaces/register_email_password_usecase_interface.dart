import '../../../../../core/helpers/app_exceptions.dart';
import '../../entity/register_email_password_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class IRegisterEmailPasswordUsecase {
  Future<Either<IAppExceptions, RegisterEmailPasswordEntity>> call(
    RegisterEmailPasswordEntity registerEntity,
  );
}
