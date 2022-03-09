class RegisterException implements Exception {
  final String message;

  RegisterException(this.message);
}

class InvalidKeysException extends RegisterException {
  InvalidKeysException(String message) : super(message);
}
