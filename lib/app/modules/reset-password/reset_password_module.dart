import 'package:autonomous_chef/app/modules/reset-password/domain/usecases/email_reset_password_usecase_impl.dart';
import 'package:autonomous_chef/app/modules/reset-password/external/datasource/email_reset_password_datasource_impl.dart';
import 'package:autonomous_chef/app/modules/reset-password/infra/repository/email_reset_password_repository_impl.dart';
import 'package:autonomous_chef/app/modules/reset-password/reset_password_Page.dart';
import 'package:autonomous_chef/app/modules/reset-password/reset_password_controller.dart';
import 'package:autonomous_chef/app/modules/reset-password/reset_password_store.dart';
import 'package:autonomous_chef/app/modules/reset-password/service/email_reset_password_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResetPasswordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ResetPasswordController(store: i())),
    Bind.lazySingleton((i) => ResetPasswordStore(usecase: i())),
    Bind.lazySingleton((i) => EmailResetPasswordUsecaseImpl(i())),
    Bind.lazySingleton((i) => EmailResetPasswordRepositoryImpl(i())),
    Bind.lazySingleton((i) => EmailResetPasswordDatasourceImpl(service: i())),
    Bind.lazySingleton(
        (i) => EmailResetPasswordServiceImpl(firebase: Modular.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ResetPasswordPage()),
  ];
}
