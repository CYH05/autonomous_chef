import 'package:autonomous_chef/app/firebase/auth/services/register_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterImpl implements IRegister {
  final FirebaseAuth _firebaseAuth;

  RegisterImpl(this._firebaseAuth);
  @override
  Future registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    }
    return true;
  }
}
