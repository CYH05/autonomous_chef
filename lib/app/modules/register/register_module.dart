import 'package:autonomous_chef/app/modules/register/domain/usecases/register_email_password/register_email_password_impl.dart';
import 'package:autonomous_chef/app/modules/register/register_Page.dart';
import 'package:autonomous_chef/app/modules/register/register_store.dart';
import 'package:autonomous_chef/app/modules/register/service/firebase_auth_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'external/datasource/register_email_password_datasource_impl.dart';
import 'infra/repository/register_email_password_repository_impl.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore(registerEmailPasswordUsecase: i())),
    Bind.singleton(
      (i) => RegisterEmailPasswordUsecaseImpl(i()),
    ),
    Bind.singleton(
      (i) => RegisterEmailPasswordRepositoryImpl(i()),
    ),
    Bind.singleton(
      (i) => RegisterEmailPasswordDatasourceImpl(service: i()),
    ),
    Bind.singleton(
      (i) => FirebaseAuthServiceImpl(firebaseAuth: FirebaseAuth.instance),
    ),
    //TODO verificar qnd terminar o core
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegisterPage()),
  ];
}
