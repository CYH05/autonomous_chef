import 'package:autonomous_chef/app/core/helpers/app_exception.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/entities/email_reset_password_entity.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/usecases/email_reset_password_usecase_interface.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ResetPasswordStore extends NotifierStore<IAppException, bool> {
  final IEmailResetPasswordUsecase _usecase;
  ResetPasswordStore({required IEmailResetPasswordUsecase usecase})
      : _usecase = usecase,
        super(false);

  Future<void> sendResetPasswordEmail({required String email}) async {
    setLoading(true);

    final entity = EmailResetPasswordEntity(email: email);

    final response = await _usecase(entity);

    final handledResponse = response.map((a) => true);

    handledResponse.fold(setError, update);

    setLoading(false);
  }
}
