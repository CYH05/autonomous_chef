import 'package:fpdart/fpdart.dart';

abstract class IRegisterEmailPasswordDatasource {
  Future<Unit> registerEmailPassword(
    Map<String, dynamic> registerEmailPasswordMap,
  );
}
