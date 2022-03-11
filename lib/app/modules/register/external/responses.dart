class FirebaseApiAuthResponse {
  final String message;
  final bool status;

  const FirebaseApiAuthResponse({
    required this.message,
    required this.status,
  });
}

class SuccessResponse extends FirebaseApiAuthResponse {
  SuccessResponse({
    required String message,
    required bool status,
  }) : super(message: message, status: true);
}

class EmailAlreadyInUseResponse extends FirebaseApiAuthResponse {
  EmailAlreadyInUseResponse()
      : super(
          message: "Email já esta sendo utilizado.",
          status: false,
        );
}
