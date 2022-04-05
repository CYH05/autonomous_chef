import 'package:autonomous_chef/app/modules/login/domain/entities/mock.dart';
import 'package:autonomous_chef/app/modules/login/domain/helpers/exception/exception.dart';
import 'package:autonomous_chef/app/modules/login/external/service/login_email_password_serivce_interface.dart';
import 'package:autonomous_chef/app/modules/login/infra/mapper/login_email_password_entity_mapper.dart';
import 'package:autonomous_chef/app/modules/login/service/login_email_password_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late FirebaseAuth _firebaseAuth;
  late ILoginEmailPasswordService _service;
  late LoginEmailPasswordEntityMock _entity;
  late UserCredential _userCredential;

  setUp(() {
    _entity = LoginEmailPasswordEntityMock();
    _firebaseAuth = FirebaseAuthMock();
    _userCredential = MockUserCredential();
    _service = LoginEmailPasswordServiceImpl(firebaseAuth: _firebaseAuth);
  });

  test(
    'LoginEmailPasswordServiceImpl should return unit when service work without any exception',
    () async {
      when(() => _firebaseAuth.signInWithEmailAndPassword(
            email: _entity.entityValid.email,
            password: _entity.entityValid.password,
          )).thenAnswer((invocation) async => _userCredential);

      final result = await _service.loginEmailPassword(_entity.entityValid);

      expect(result, isA<Unit>());
    },
  );

  test(
    'LoginEmailPasswordServiceImpl should throw a firebaseException with error code: user-disabled.',
    () async {
      when(() => _firebaseAuth.signInWithEmailAndPassword(
            email: _entity.entityValid.email,
            password: _entity.entityValid.password,
          )).thenThrow(
        FirebaseAuthException(code: "user-disabled"),
      );

      expect(
        () async => await _service.loginEmailPassword(_entity.entityValid),
        throwsA(isA<UserDisabledException>()),
      );
    },
  );

  test(
    'LoginEmailPasswordServiceImpl should throw a firebaseException with error code: user-not-found.',
    () async {
      when(() => _firebaseAuth.signInWithEmailAndPassword(
            email: _entity.entityValid.email,
            password: _entity.entityValid.password,
          )).thenThrow(
        FirebaseAuthException(code: "user-not-found"),
      );

      expect(
        () async => await _service.loginEmailPassword(_entity.entityValid),
        throwsA(isA<UserNotFoundException>()),
      );
    },
  );

  test(
    'LoginEmailPasswordServiceImpl should throw a firebaseException when error code is email-invalid or wrong-password.',
    () async {
      when(() => _firebaseAuth.signInWithEmailAndPassword(
            email: _entity.entityValid.email,
            password: _entity.entityValid.password,
          )).thenThrow(
        FirebaseAuthException(code: "wrong-password"),
      );

      expect(
        () async => await _service.loginEmailPassword(_entity.entityValid),
        throwsA(isA<EmailOrPasswordInvalidException>()),
      );
    },
  );
}
