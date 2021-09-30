import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_study/src/modules/auth/blocs/events/login_event.dart';
import 'package:modular_study/src/modules/auth/blocs/login_bloc.dart';
import 'package:modular_study/src/modules/auth/blocs/states/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginBloc> {
  // Apenas utilizar ModularState quando for nessário fazer dispose no Bind
  // assim que sair desta tela/página, neste caso, para o LoginBloc

  @override
  void initState() {
    bloc.stream.listen((state) async {
      if (state is LoginSuccess) {
        await Future.delayed(const Duration(milliseconds: 300));
        Modular.to.navigate('/products/red');
      }

      if (state is LoginFailure) {
        final snackBar = SnackBar(
          content: const Text('Erro ao fazer login!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    bloc.add(CheckLoggedState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
          bloc: bloc,
          builder: (context, state) {
            //
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is LoginSuccess) {
              return const Center(
                child: Text('Logado!'),
              );
            }

            return Center(
              child: ElevatedButton(
                child: Text('Entrar'),
                onPressed: () => bloc.add(
                    LoginWithEmail(password: '321', email: 'andrey@mail.com')),
              ),
            );
          }),
    );
  }
}
