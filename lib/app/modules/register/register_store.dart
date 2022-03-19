import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../core/helpers/app_exception.dart';
import 'domain/useCases/interfaces/register_email_password_usecase_interface.dart';

class RegisterStore extends NotifierStore<IAppException, bool> {
  final IRegisterEmailPasswordUsecase _registerEmailPasswordUsecase;

  RegisterStore({
    required IRegisterEmailPasswordUsecase registerEmailPasswordUsecase,
  })  : _registerEmailPasswordUsecase = registerEmailPasswordUsecase,
        super(false);

/*   late final RegisterEmailPasswordUsecaseImpl _registerEmailPasswordUsecase;

  RegisterStore({
    required IRegisterEmailPasswordUsecase registerEmailPasswordUsecase,
  }) : super(false) {
    _registerEmailPasswordUsecase = registerEmailPasswordUsecase;
  } */

  Future<void> registerEmailPassword({
    required String email,
    required String password,
  }) async {
    setLoading(true);
    final registerEmailPasswordEntity = RegisterEmailPasswordEntity(
      email: email,
      password: password,
    );

    final response =
        await _registerEmailPasswordUsecase(registerEmailPasswordEntity);

    final handledResponse = response.map((a) => true);

    handledResponse.fold(setError, update);

    setLoading(false);
  }
}
