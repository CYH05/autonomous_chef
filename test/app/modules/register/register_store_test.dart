import 'package:flutter_test/flutter_test.dart';
import 'package:autonomous_chef/app/modules/register/register_store.dart';
 
void main() {
  late RegisterStore store;

  setUpAll(() {
    store = RegisterStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}