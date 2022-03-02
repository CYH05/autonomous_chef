abstract class IAuthentication {
  Future<Map<String, dynamic>> login(
      {required String email, required String password});
}
