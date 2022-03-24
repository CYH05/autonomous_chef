import 'package:autonomous_chef/app/modules/register/domain/entity/mock.dart';
import 'package:autonomous_chef/app/modules/register/domain/helpers/exception/exception.dart';
import 'package:autonomous_chef/app/modules/register/infra/mapper/register_email_password_entity_mapper.dart';
import 'package:autonomous_chef/app/modules/register/service/firebase_auth_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../lib/app/core/helpers/firebase_auth_exception_mock.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

void main() async {
  late MockFirebaseAuth _firebaseAuth;
  late UserCredential _userCredential;
  late FirebaseAuthServiceImpl _service;
  late RegisterEmailPasswordMock _entity;

  setUp(() {
    _firebaseAuth = MockFirebaseAuth();
    _userCredential = MockUserCredential();
    _service = FirebaseAuthServiceImpl(firebaseAuth: _firebaseAuth);
    _entity = RegisterEmailPasswordMock();
  });
  test(
    'FirebaseAuthServiceImpl, should return void when firebaseAuth work normally.',
    () async {
      when(() => _firebaseAuth.createUserWithEmailAndPassword(
            email: _entity.entityValid.email,
            password: _entity.entityValid.password,
          )).thenAnswer((invocation) async => _userCredential);

      final result = await _service.registerFirebaseAuth(
        RegisterEmailPasswordMapper.toMap(_entity.entityValid),
      );
      expect(result, isA<Unit>());
    },
  );

  test(
    'FirebaseAuthServiceImpl, should throw a firebaseException with error code: email-already-in-use.',
    () async {
      when(
        () => _firebaseAuth.createUserWithEmailAndPassword(
          email: _entity.entityValid.email,
          password: _entity.entityValid.password,
        ),
      ).thenThrow(
        FirebaseAuthExceptionMock(
          code: "email-already-in-use",
          stackTrace: StackTrace.fromString(""),
        ),
      );

      expect(
          () async => await _service.registerFirebaseAuth(
                RegisterEmailPasswordMapper.toMap(_entity.entityValid),
              ),
          throwsA(
            isA<EmailAlreadyInUseException>(),
          ));
    },
  );

  test(
    'FirebaseAuthServiceImpl, should throw a firebaseException with error code: invalid-email.',
    () async {
      when(
        () => _firebaseAuth.createUserWithEmailAndPassword(
          email: _entity.entityInvalidEmail.email,
          password: _entity.entityInvalidEmail.password,
        ),
      ).thenThrow(
        FirebaseAuthExceptionMock(
          code: "invalid-email",
          stackTrace: StackTrace.fromString(""),
        ),
      );

      expect(
          () async => await _service.registerFirebaseAuth(
                RegisterEmailPasswordMapper.toMap(
                  _entity.entityInvalidEmail,
                ),
              ),
          throwsA(
            isA<InvalidEmailException>(),
          ));
    },
  );

  test(
    'FirebaseAuthServiceImpl, should throw a firebaseException with error code: operation-not-allowed.',
    () async {
      when(
        () => _firebaseAuth.createUserWithEmailAndPassword(
          email: _entity.entityValid.email,
          password: _entity.entityValid.password,
        ),
      ).thenThrow(
        FirebaseAuthExceptionMock(
          code: "operation-not-allowed",
          stackTrace: StackTrace.fromString(""),
        ),
      );

      expect(
          () async => await _service.registerFirebaseAuth(
                RegisterEmailPasswordMapper.toMap(
                  _entity.entityValid,
                ),
              ),
          throwsA(
            isA<EmailOrPasswordEnabledException>(),
          ));
    },
  );

  test(
    'FirebaseAuthServiceImpl, should throw a firebaseException with error code: weak-password.',
    () async {
      when(
        () => _firebaseAuth.createUserWithEmailAndPassword(
          email: _entity.entityWeekPassword.email,
          password: _entity.entityWeekPassword.password,
        ),
      ).thenThrow(
        FirebaseAuthExceptionMock(
          code: "weak-password",
          stackTrace: StackTrace.fromString(""),
        ),
      );

      expect(
          () async => await _service.registerFirebaseAuth(
                RegisterEmailPasswordMapper.toMap(
                  _entity.entityWeekPassword,
                ),
              ),
          throwsA(
            isA<WeekPasswordException>(),
          ));
    },
  );
}
