abstract class IRegister {
  Future registerWithEmailAndPassword({
    required String email,
    required String password,
  });
}
