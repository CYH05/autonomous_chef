bool validateEmail(String email) {
  final regex = RegExp(r"[a-z0-9.-_]+@[a-z0-9.-_]+");
  if (regex.hasMatch(email)) {
    return true;
  }
  return false;
}

bool validatePassword(String password) {
  /*
    /^
    (?=.*\d)              // deve conter ao menos um dígito
    (?=.*[a-z])           // deve conter ao menos uma letra minúscula
    (?=.*[A-Z])           // deve conter ao menos uma letra maiúscula
    (?=.*[$*&@#])         // deve conter ao menos um caractere especial
    [0-9a-zA-Z$*&@#]{8,}  // deve conter ao menos 8 caracteres 
    $/
  */
  final regex = RegExp(
      r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])[0-9a-zA-Z$*&@#]{8,}");

  if (regex.hasMatch(password)) {
    return true;
  }
  return false;
}

bool comparePassword(
  String password,
  String comparePassword,
) =>
    password == comparePassword;
