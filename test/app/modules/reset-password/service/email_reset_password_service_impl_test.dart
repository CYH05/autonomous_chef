import 'package:autonomous_chef/app/modules/reset-password/domain/entities/mock.dart';
import 'package:autonomous_chef/app/modules/reset-password/domain/helpers/exception/exception.dart';
import 'package:autonomous_chef/app/modules/reset-password/external/service/email_reset_password_service_interface.dart.dart';
import 'package:autonomous_chef/app/modules/reset-password/service/email_reset_password_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

void main() {
  late FirebaseAuth _firebaseAuth;
  late IEmailResetPasswordService _service;
  late EmailResetPasswordEntityMock _entity;

  setUp(() {
    _firebaseAuth = FirebaseAuthMock();
    _service = EmailResetPasswordServiceImpl(firebase: _firebaseAuth);
    _entity = EmailResetPasswordEntityMock();
  });

  test(
    'EmailResetPasswordServiceImpl should return unit if FirebaseAuth library work without failure.',
    () async {
      when(
        () => _firebaseAuth.sendPasswordResetEmail(
          email: _entity.entityValid.email,
        ),
      ).thenAnswer((_) async {});

      final response = await _service.sendResetEmail(_entity.entityValid);

      expect(response, isA<Unit>());
    },
  );

  test(
    'EmailResetPasswordServiceImpl should return throw InvalidEmailException when email is not valid.',
    () async {
      when(
        () => _firebaseAuth.sendPasswordResetEmail(
          email: _entity.entityValid.email,
        ),
      ).thenThrow(const InvalidEmailException());

      expect(
        () async {
          await _service.sendResetEmail(_entity.entityValid);
        },
        throwsA(isA<InvalidEmailException>()),
      );
    },
  );

  test(
    'EmailResetPasswordServiceImpl should return throw MissingAndroidPackageNameException when android package name (in FirebaseAuth function) is missing in request.',
    () async {
      when(
        () => _firebaseAuth.sendPasswordResetEmail(
          email: _entity.entityValid.email,
        ),
      ).thenThrow(const MissingAndroidPackageNameException());

      expect(
        () async {
          await _service.sendResetEmail(_entity.entityValid);
        },
        throwsA(isA<MissingAndroidPackageNameException>()),
      );
    },
  );

  test(
    'EmailResetPasswordServiceImpl should return throw MissingContinueURIException when Continue URI (in FirebaseAuth function) is missing in request.',
    () async {
      when(
        () => _firebaseAuth.sendPasswordResetEmail(
          email: _entity.entityValid.email,
        ),
      ).thenThrow(const MissingContinueURIException());

      expect(
        () async {
          await _service.sendResetEmail(_entity.entityValid);
        },
        throwsA(isA<MissingContinueURIException>()),
      );
    },
  );

  test(
    'EmailResetPasswordServiceImpl should return throw MissingIOSBundleIdException when IOS bundle Id (in FirebaseAuth function) is missing in request.',
    () async {
      when(
        () => _firebaseAuth.sendPasswordResetEmail(
          email: _entity.entityValid.email,
        ),
      ).thenThrow(const MissingIOSBundleIdException());

      expect(
        () async {
          await _service.sendResetEmail(_entity.entityValid);
        },
        throwsA(isA<MissingIOSBundleIdException>()),
      );
    },
  );

  test(
    'EmailResetPasswordServiceImpl should return throw InvalidContinueURIException when continue URI (in FirebaseAuth function) is invalid in request.',
    () async {
      when(
        () => _firebaseAuth.sendPasswordResetEmail(
          email: _entity.entityValid.email,
        ),
      ).thenThrow(const InvalidContinueURIException());

      expect(
        () async {
          await _service.sendResetEmail(_entity.entityValid);
        },
        throwsA(isA<InvalidContinueURIException>()),
      );
    },
  );

  test(
    'EmailResetPasswordServiceImpl should return throw UnauthorizedContinueURIException when continue URI (in FirebaseAuth function) is not in white list of firebase project.',
    () async {
      when(
        () => _firebaseAuth.sendPasswordResetEmail(
          email: _entity.entityValid.email,
        ),
      ).thenThrow(const UnauthorizedContinueURIException());

      expect(
        () async {
          await _service.sendResetEmail(_entity.entityValid);
        },
        throwsA(isA<UnauthorizedContinueURIException>()),
      );
    },
  );

  test(
    'EmailResetPasswordServiceImpl should return throw UserNotFoundException when has not an user with email address sended.',
    () async {
      when(
        () => _firebaseAuth.sendPasswordResetEmail(
          email: _entity.entityValid.email,
        ),
      ).thenThrow(const UserNotFoundException());

      expect(
        () async {
          await _service.sendResetEmail(_entity.entityValid);
        },
        throwsA(isA<UserNotFoundException>()),
      );
    },
  );
}
