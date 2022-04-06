import 'package:fpdart/fpdart.dart';

import '../../domain/entity/register_email_password_entity.dart';

abstract class IFirebaseAuthService {
  Future<Unit> registerFirebaseAuth(
    RegisterEmailPasswordEntity paramEntity,
  );
}
