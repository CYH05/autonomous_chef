import 'package:fpdart/fpdart.dart';

abstract class ILoginEmailPasswordDatasource {
  Future<Unit> loginEmailPassword(Map<String, dynamic> map);
}
