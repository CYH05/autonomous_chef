import 'package:autonomous_chef/app/firebase/auth/services/authentication_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationImpl extends IAuthentication {
  late final FirebaseAuth _firebaseAuth;

  AuthenticationImpl(this._firebaseAuth);

  @override
  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    Map<String, dynamic> authResponse = {"isAuthenticated": false};
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {
      authResponse["errorMessage"] = "Email or password doesn't match";
      return authResponse;
    }
    authResponse["isAuthenticated"] = true;
    return authResponse;
  }

}
