import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthExceptionMock extends FirebaseAuthException {
  
  @override
  final StackTrace stackTrace;

  FirebaseAuthExceptionMock({
    required String code,
    required this.stackTrace,
  }) : super(code: code);
}
