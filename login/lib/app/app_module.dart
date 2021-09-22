import 'package:flutter_modular/flutter_modular.dart';
//import 'package:login/app/shared/repositories/localStorage/local_storage_hive.dart';
import 'package:login/app/shared/repositories/localStorage/local_storage_interface.dart';
import 'package:login/app/shared/repositories/localStorage/local_storage_shared.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // Tipar o Bind para ser possível fazer a troca do contrato nos testes
    Bind<ILocalStorage>((i) => LocalStorageShared()),
    //Bind((i) => LocalStorageHive()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
