import 'package:mobx/mobx.dart';

import 'models/client.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  var client = Client();

  // Habilita o botão salvar se os campos cumprirem os requisitos
  @computed
  bool get isValid {
    return validateName() == null &&
        validateEmail() == null &&
        validateCPF() == null;
  }

  // Validador Nome
  String? validateName() {
    if (client.name == null || client.name!.isEmpty)
      return 'Este campo é obrigatório';
    else if (client.name!.length < 3) {
      return 'Seu nome precisa ter pelo menos 3 caracteres';
    }
    return null;
  }

  // Validador Email
  String? validateEmail() {
    if (client.email == null || client.email!.isEmpty)
      return 'Este campo é obrigatório';
    else if (!client.email!.contains('@')) {
      return 'Email inválido';
    }
    return null;
  }

  // Validador CPF
  String? validateCPF() {
    if (client.cpf == null || client.cpf!.isEmpty)
      return 'Este campo é obrigatório';
    else if (client.cpf!.length < 11) {
      return 'CPF inválido';
    }
    return null;
  }
}
