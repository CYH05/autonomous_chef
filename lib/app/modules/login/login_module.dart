import 'package:autonomous_chef/app/modules/login/login_controller.dart';
import 'package:autonomous_chef/app/modules/login/service/login_email_password_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/login_email_password/login_email_password_usecase_impl.dart';
import 'external/datasource/login_email_password_datasource_impl.dart';
import 'infra/repository/login_email_password_repositoy_impl.dart';
import 'login_page.dart';
import 'login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController(store: i())),
    Bind.lazySingleton((i) => LoginStore(usecase: i())),
    Bind.lazySingleton(
      (i) => LoginEmailPasswordUsecaseImpl(i()),
    ),
    Bind.lazySingleton(
      (i) => LoginEmailPasswordRepositoryImpl(i()),
    ),
    Bind.lazySingleton(
      (i) => LoginEmailPasswordDatasourceImpl(
          service: i.get<LoginEmailPasswordServiceImpl>()),
    ),
    Bind.lazySingleton(
      (i) => LoginEmailPasswordServiceImpl(firebaseAuth: FirebaseAuth.instance),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
