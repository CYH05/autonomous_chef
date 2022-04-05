import 'package:flutter_test/flutter_test.dart';
import 'package:autonomous_chef/app/modules/reset-password/resetPassword_store.dart';
 
void main() {
  late ResetPasswordStore store;

  setUpAll(() {
    store = ResetPasswordStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}