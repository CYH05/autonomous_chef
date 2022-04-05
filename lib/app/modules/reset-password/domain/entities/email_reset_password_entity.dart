import 'package:firebase_auth/firebase_auth.dart';

class EmailResetPasswordEntity {
  final String email;

  const EmailResetPasswordEntity({required this.email});
}

void aas() {
  final a = FirebaseAuth.instance;
  a.sendPasswordResetEmail(email: "email");
}
