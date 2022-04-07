import 'package:autonomous_chef/app/modules/reset-password/domain/entities/mock.dart';
import 'package:autonomous_chef/app/modules/reset-password/external/datasource/email_reset_password_datasource_impl.dart';
import 'package:autonomous_chef/app/modules/reset-password/external/service/email_reset_password_service_interface.dart.dart';
import 'package:autonomous_chef/app/modules/reset-password/infra/datasource/email_reset_password_datasource_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class ServiceMock extends Mock implements IEmailResetPasswordService {}

void main() {
  late IEmailResetPasswordService _service;
  late IEmailResetPasswordDatasource _datasource;
  late EmailResetPasswordEntityMock _entity;

  setUp(() {
    _service = ServiceMock();
    _datasource = EmailResetPasswordDatasourceImpl(service: _service);
    _entity = EmailResetPasswordEntityMock();
  });

  test(
    'EmailResetPasswordDatasourceImpl should return unit when service work normally.',
    () async {
      when(() => _service.sendResetEmail(_entity.entityValid))
          .thenAnswer((_) async => unit);

      final result =
          await _datasource.sendEmailResetPassword(_entity.entityValid);

      expect(result, isA<Unit>());
    },
  );
}
