import 'package:flutter_modular/flutter_modular.dart';

import 'modules/register/register_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: RegisterModule()),
    //ModuleRoute(Modular.initialRoute, module: LoginModule()),
  ];
}
