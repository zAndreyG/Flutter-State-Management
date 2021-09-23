import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  User? user;

  @action
  setUser(User? value) {
    user = value;
    status = user == null ? AuthStatus.logOff : AuthStatus.logIn;
  }

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser).catchError((e) {
      print(e.toString());
    });
  }

  @action
  Future loginWithGoogle() async {
    UserCredential userCredential = await _authRepository.getGoogleLogin();
    user = userCredential.user;
  }

  Future logOut() async {
    return _authRepository.getLogOut();
  }
}

enum AuthStatus { loading, logIn, logOff }
