import 'package:flutter_triple/flutter_triple.dart';

import '../../firebase/auth/services/logout_interface.dart';

class HomeStore extends NotifierStore<Exception, int> {
  final ILogout _logoutInterface;
  String errorMessage = "";

  HomeStore(this._logoutInterface) : super(0);

  bool logout() {
    var response = _logoutInterface.logout();
    if (!response) {
      errorMessage =
          "Something goes wrong and we cannot logout you, wait few minutes and try again.";
      return false;
    }
    return true;
  }
}
