import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_1/app/app_controller.dart';
import 'package:slidy_1/app/pages/home/home_controller.dart';
import 'package:slidy_1/app/pages/home/home_page.dart';
import 'package:slidy_1/app/shared/repositories/poke_repository.dart';
import 'package:slidy_1/app/shared/utils/constants.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppController()),
    Bind((i) => HomeController(i.get())),
    Bind((i) => PokeRepository(i.get())),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
