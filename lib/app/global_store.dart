class GlobalStore {
  bool isLogged;

  GlobalStore({required user}) : isLogged = checkIsLogged(user);
}

bool checkIsLogged(user) {
  if (user != null) {
    return true;
  }
  return false;
}
