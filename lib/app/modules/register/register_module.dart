import 'package:autonomous_chef/app/firebase/auth/services/register_interface.dart';
import 'package:autonomous_chef/app/modules/register/register_Page.dart';
import 'package:autonomous_chef/app/modules/register/register_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../firebase/auth/services/register_impl.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore(i.get())),
    Bind<IRegister>((i) => RegisterImpl(FirebaseAuth.instance)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegisterPage()),
  ];
}
