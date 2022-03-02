import 'package:autonomous_chef/app/modules/login/login_Page.dart';
import 'package:autonomous_chef/app/modules/login/login_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../firebase/auth/services/authentication_impl.dart';
import '../../firebase/auth/services/authentication_interface.dart';
import '../home/home_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore(i.get<IAuthentication>())),
    Bind<IAuthentication>((i) => AuthenticationImpl(FirebaseAuth.instance)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
    ChildRoute("/home/", child: (_, args) => const HomePage()),
  ];
}
