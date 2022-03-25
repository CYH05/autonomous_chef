import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:autonomous_chef/app/modules/register/service/firebase_auth_service_impl.dart';

import 'domain/usecases/login_email_password/login_email_password_usecase_impl.dart';
import 'external/datasource/login_email_password_datasource_impl.dart';
import 'infra/repository/login_email_password_repositoy_impl.dart';
import 'login_page.dart';
import 'login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore(usecase: i())),
    Bind.lazySingleton(
      (i) => LoginEmailPasswordUsecaseImpl(i()),
    ),
    Bind.lazySingleton(
      (i) => LoginEmailPasswordRepositoryImpl(i()),
    ),
    Bind.lazySingleton(
      (i) => LoginEmailPasswordDatasourceImpl(service: i()),
    ),
    Bind.lazySingleton(
      (i) => FirebaseAuthServiceImpl(firebaseAuth: FirebaseAuth.instance),
    ),
    //TODO verificar qnd terminar o core, para reutilizar o firebaseAuth.instance em outros modulos.
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
