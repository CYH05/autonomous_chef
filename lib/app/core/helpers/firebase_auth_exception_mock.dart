import 'package:firebase_auth/firebase_auth.dart';

//TODO considerar criar uma classe q extends de mock e adicionando os campos.
class FirebaseAuthExceptionMock extends FirebaseAuthException {
  @override
  final StackTrace stackTrace;

  FirebaseAuthExceptionMock({
    required String code,
    required this.stackTrace,
  }) : super(code: code);
}
