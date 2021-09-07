import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_1/app/app_controller.dart';
import 'package:slidy_1/app/pages/home/home_controller.dart';
import 'package:slidy_1/app/pages/home/home_page.dart';
import 'package:slidy_1/app/pages/other/other_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppController()),
    Bind((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
    ChildRoute('/other', child: (_, args) => OtherPage()),
  ];
}
