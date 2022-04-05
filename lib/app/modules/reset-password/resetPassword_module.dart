import 'package:autonomous_chef/app/modules/reset-password/resetPassword_Page.dart';
import 'package:autonomous_chef/app/modules/reset-password/resetPassword_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResetPasswordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ResetPasswordStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ResetPasswordPage()),
  ];
}
