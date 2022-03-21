import 'package:autonomous_chef/app/modules/register/domain/entity/mock.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exception/exception.dart';
import 'package:autonomous_chef/app/modules/register/infra/mappers/register_email_password_entity_mapper.dart';
import 'package:autonomous_chef/app/modules/register/service/firebase_auth_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

void main() async {
  late MockFirebaseAuth _firebaseAuthMock;
  late MockUserCredential _userCredentialMock;
  late FirebaseAuthServiceImpl _service;
  late RegisterEmailPasswordMock _entityMock;

  setUp(() {
    _firebaseAuthMock = MockFirebaseAuth();
    _userCredentialMock = MockUserCredential();
    _service = FirebaseAuthServiceImpl(firebaseAuth: _firebaseAuthMock);
    _entityMock = RegisterEmailPasswordMock();
  });
  test(
    'FirebaseAuthServiceImpl, should return void when firebaseAuth work normally.',
    () async {
      when(() => _firebaseAuthMock.createUserWithEmailAndPassword(
            email: _entityMock.entityValid.email,
            password: _entityMock.entityValid.password,
          )).thenAnswer((invocation) async => _userCredentialMock);

      final result = await _service.registerFirebaseAuth(
        RegisterEmailPasswordMapper.toMap(_entityMock.entityValid),
      );
      expect(result, isA<Unit>());
    },
  );

  test(
    'FirebaseAuthServiceImpl, should throw a firebaseException with error code: email-already-in-use.',
    () async {
      when(
        () => _firebaseAuthMock.createUserWithEmailAndPassword(
          email: "testEmail",
          password: "testPassword",
        ),
      ).thenThrow(FirebaseAuthException(code: "email-already-in-use"));

      /* thenAnswer(
        (invocation) async =>
            //TODO usar o Skip() para não detectar no flutter test run e diminuir a taxa de coverage
            throw FirebaseAuthException(code: "email-already-in-use"),
      ); */

      expect(
          () async => await _service.registerFirebaseAuth(
                RegisterEmailPasswordMapper.toMap(_entityMock.entityValid),
              ),
          throwsA(
            isA<EmailAlreadyInUseException>(),
          ));
    },
  );
}
