import 'package:autonomous_chef/app/modules/login/domain/usecases/login_email_password/login_email_password_usecase_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../core/helpers/app_exception.dart';
import 'domain/entities/login_email_password_entity.dart';

class LoginStore extends NotifierStore<IAppException, bool> {
  final ILoginEmailPasswordUsecase _usecase;

  LoginStore({
    required ILoginEmailPasswordUsecase usecase,
  })  : _usecase = usecase,
        super(false);

  Future<void> loginEmailPassword({
    required String email,
    required String password,
  }) async {
    setLoading(true);

    final loginEntity = LoginEmailPasswordEntity(
      email: email,
      password: password,
    );

    final response = await _usecase(loginEntity);

    final handledResponse = response.map((a) => true);

    handledResponse.fold(setError, update);

    setLoading(false);

    if (handledResponse.isRight()) {
      Modular.to.navigate('/home');
    }
  }
}
