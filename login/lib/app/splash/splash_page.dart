import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late ReactionDisposer disposer;

  @override
  void initState() {
    disposer = autorun((_) {
      final auth = Modular.get<AuthController>();

      if (auth.status == AuthStatus.logIn) {
        Modular.to.pushReplacementNamed('/home/');
      } else if (auth.status == AuthStatus.logOff) {
        Modular.to.pushReplacementNamed('/login/');
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
