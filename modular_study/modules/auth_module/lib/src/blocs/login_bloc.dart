import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'events/login_event.dart';
import 'states/login_state.dart';
import '../repositories/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  final SharedPreferences shared;

  LoginBloc(this.loginRepository, this.shared) : super(LoginIdle()) {
    on<LoginWithEmail>(loginEmail);
    on<CheckLoggedState>(checkLogged);
  }

  loginEmail(LoginWithEmail event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 1));

    try {
      await loginRepository.login(event.email, event.password);
      emit(LoginSuccess());
      shared.setBool('isLogged', true);
    } catch (e) {
      emit(LoginFailure('Erros na senha ou email'));
    }
  }

  checkLogged(CheckLoggedState event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 1));
    bool isLogged = shared.getBool('isLogged') ?? false;
    if (isLogged)
      emit(LoginSuccess());
    else
      emit(LoginIdle());
  }
}
