import '../responses.dart';

abstract class IFirebaseAuthService {
  Future<FirebaseApiAuthResponse> registerFirebaseAuth(
    Map<String, dynamic> map,
  );
}
