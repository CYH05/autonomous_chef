class IAppException implements Exception {
  final String message;
  const IAppException({required this.message});
}

class AppException extends IAppException {
  final StackTrace? stackTrace;

  const AppException({
    required String message,
    this.stackTrace,
  }) : super(message: message);
}

class AppError extends IAppException {
  const AppError({required String message}) : super(message: message);
}
