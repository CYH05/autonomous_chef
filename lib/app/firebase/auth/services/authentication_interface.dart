abstract class IAuthentication {
  Future<bool> register();
  Future<Map<String, dynamic>> login(
      {required String email, required String password});
  Future<void> logout();
}
