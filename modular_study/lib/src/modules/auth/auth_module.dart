import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_study/src/modules/auth/blocs/login_bloc.dart';
import 'package:modular_study/src/modules/auth/repositories/login_repository.dart';
import 'package:modular_study/src/modules/auth/views/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => LoginRepository()),
        Bind.singleton((i) => LoginBloc(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => LoginPage()),
      ];
}
