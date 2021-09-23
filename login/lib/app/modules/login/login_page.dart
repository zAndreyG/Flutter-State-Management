import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:login/app/modules/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginController> {
  final LoginController store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: controller.loginWithGoogle,
              child: Text('Login with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
