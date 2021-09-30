class LoginRepository {
  Future<bool> login(String email, String password) async {
    if (email == 'andrey@mail.com' && password == '321') {
      return true;
    } else {
      throw Exception('Erro ao fazer login!');
    }
  }
}
