bool validateEmail(String email) {
  final regex = RegExp(r"[a-z0-9.-_]+@[a-z0-9.-_]+");
  if (regex.hasMatch(email)) {
    return true;
  }
  return false;
}
