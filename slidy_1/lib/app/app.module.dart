import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_1/app/app_controller.dart';
import 'package:slidy_1/app/modules/home/home_module.dart';
import 'package:slidy_1/app/shared/utils/constants.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppController()),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
  ];
}
