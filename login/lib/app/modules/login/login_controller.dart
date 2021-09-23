import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController authController = Modular.get();

  @observable
  bool loading = false;

  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await authController.loginWithGoogle();
      Modular.to.pushReplacementNamed('/home/');
    } catch (e) {
      loading = false;
    }
  }
}
