import 'package:autonomous_chef/app/modules/login/domain/entities/login_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/login/domain/repository/login_email_password_repository_interface.dart';
import 'package:autonomous_chef/app/modules/login/domain/usecases/login_email_password/login_email_password_usecase_interface.dart';
import 'package:fpdart/fpdart.dart';

class LoginEmailPassword implements ILoginEmailPasswordUsecase {
  final ILoginEmailPasswordRepositoy _repository;

  const LoginEmailPassword({required repository}) : _repository = repository;

  @override
  Future<Either<Exception, LoginEmailPasswordentity>> call() {
    throw UnimplementedError();
  }
}
