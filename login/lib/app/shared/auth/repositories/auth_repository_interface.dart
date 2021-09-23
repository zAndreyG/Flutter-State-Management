import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<User?> getUser();
  Future<UserCredential> getGoogleLogin();
  Future getEmailPasswordLogin();
  Future<String> getToken();
  Future getLogOut();
}
