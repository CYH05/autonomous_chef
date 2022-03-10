class IAppExceptions implements Exception {
  final String message;
  const IAppExceptions({required this.message});
}

class AppException extends IAppExceptions {
  final StackTrace stackTrace;

  const AppException({
    required String message,
    required this.stackTrace,
  }) : super(message: message);
}

class AppError extends IAppExceptions {
  const AppError({required String message}) : super(message: message);
}
