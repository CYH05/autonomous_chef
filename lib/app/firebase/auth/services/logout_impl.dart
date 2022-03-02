import 'package:firebase_auth/firebase_auth.dart';

import 'logout_interface.dart';

class LogoutImpl implements ILogout {
  final FirebaseAuth _firebaseAuth;

  LogoutImpl(this._firebaseAuth);

  @override
  logout() {
    try {
      _firebaseAuth.signOut();
    } catch (e) {
      return "Falha ao se desconectar";
    }
  }
}
