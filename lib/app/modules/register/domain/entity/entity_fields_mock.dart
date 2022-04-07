class EmailPasswordValidatorMock {
  final String validEmail = 'teste@teste.teste';
  final String validPassword = 'Teste@123';
  final String invalidEmail = 'testeteste.teste';
  final String emailBlank = '';
  final String passwordWithoutUppercase = 'teste@123';
  final String passwordWithoutLowercase = 'TESTE@123';
  final String passwordWithoutDigit = 'TESTE@teste';
  final String passwordWithoutSpecial = 'TESTE1234';
  final String passwordBlank = '';
  final String passwordWithoutMinLength = 'Teste@1';
}
