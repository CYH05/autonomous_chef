import 'package:autonomous_chef/app/modules/ingredient/ingredient_module.dart';
import 'package:autonomous_chef/app/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/register/register_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute("/home/", module: HomeModule()),
    ModuleRoute("/register/", module: RegisterModule()),
    ModuleRoute("/ingredient/", module: IngredientModule()),
  ];
}
