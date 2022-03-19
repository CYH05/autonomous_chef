import 'package:autonomous_chef/app/modules/register/domain/entity/register_email_password_entity.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exceptions.dart';
import 'package:autonomous_chef/app/modules/register/service/firebase_auth_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

void main() async {
  late final MockFirebaseAuth _firebaseAuth;
  late final MockUserCredential _userCredential;
  late final FirebaseAuthServiceImpl _service;

  setUp(() {
    _firebaseAuth = MockFirebaseAuth();
    _userCredential = MockUserCredential();
    _service = FirebaseAuthServiceImpl(_firebaseAuth);
  });

  final userDataMap = {
    "email": "testEmail",
    "password": "testPassword",
  };

  test(
    'FirebaseAuthServiceImpl, should return void when firebaseAuth work normally.',
    () async {
      when(() => _firebaseAuth.createUserWithEmailAndPassword(
            email: "testEmail",
            password: "testPassword",
          )).thenAnswer((invocation) async => _userCredential);

      final result = await _service.registerFirebaseAuth(userDataMap);
      expect(result, isA<RegisterEmailPasswordEntity>());
    },
  );

// TODO ver como testar o lançamento de exceção do firebase seguido do lançamento de exceção do app.
  test(
    'FirebaseAuthServiceImpl, should throw a firebaseException with error code: email-already-in-use.',
    () async {
      when(
        () => _firebaseAuth.createUserWithEmailAndPassword(
          email: "testEmail",
          password: "testPassword",
        ),
      ).thenAnswer(
        (invocation) async =>
            //TODO usar o Skip() para não detectar no flutter test run e diminuir a taxa de coverage
            throw FirebaseAuthException(code: "email-already-in-use"),
      );

      expect(() async => await _service.registerFirebaseAuth(userDataMap),
          throwsA(isA<EmailAlreadyInUseException>()));
    },
  );
}
