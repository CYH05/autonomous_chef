import 'package:fpdart/fpdart.dart';

abstract class ILoginEmailPasswordService {
  Future<Unit> loginEmailPassword(Map<String, dynamic> map);
}
