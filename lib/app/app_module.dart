import 'package:autonomous_chef/app/global_store.dart';
import 'package:autonomous_chef/app/modules/home/home_module.dart';
import 'package:autonomous_chef/app/modules/reset-password/reset_password_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';
import 'modules/register/register_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => FirebaseAuth.instance),
    Bind.singleton((i) => GlobalStore(user: FirebaseAuth.instance.currentUser)),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute("/home/", module: HomeModule()),
    ModuleRoute("/register/", module: RegisterModule()),
    ModuleRoute("/reset-password/", module: ResetPasswordModule()),
  ];
}
