import 'package:firebase_auth/firebase_auth.dart';

import 'logout_interface.dart';

class LogoutImpl implements ILogout {
  final FirebaseAuth _firebaseAuth;

  LogoutImpl(this._firebaseAuth);

  @override
  bool logout() {
    try {
      _firebaseAuth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
