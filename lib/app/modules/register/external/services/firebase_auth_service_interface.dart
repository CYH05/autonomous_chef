import 'package:fpdart/fpdart.dart';

abstract class IFirebaseAuthService {
  Future<Unit> registerFirebaseAuth(
    Map<String, dynamic> map,
  );
}
