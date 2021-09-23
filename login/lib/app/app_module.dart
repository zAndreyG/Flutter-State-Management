import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/shared/auth/auth_controller.dart';
import 'package:login/app/shared/auth/repositories/auth_repository.dart';
import 'package:login/app/shared/auth/repositories/auth_repository_interface.dart';
//import 'package:login/app/shared/repositories/localStorage/local_storage_hive.dart';
import 'package:login/app/shared/repositories/localStorage/local_storage_interface.dart';
import 'package:login/app/shared/repositories/localStorage/local_storage_shared.dart';
import 'package:login/app/splash/splash_page.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // Tipar o Bind para ser possível fazer a troca do contrato nos testes
    Bind<ILocalStorage>((i) => LocalStorageShared()),
    Bind<IAuthRepository>((i) => AuthRepository()),
    Bind((i) => AuthController()),
    //Bind((i) => LocalStorageHive()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
