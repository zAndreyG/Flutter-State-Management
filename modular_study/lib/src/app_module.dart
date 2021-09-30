import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_study/src/modules/auth/auth_module.dart';
import 'package:modular_study/src/modules/auth/guards/auth_guard.dart';
import 'package:modular_study/src/modules/product/product_module.dart';
import 'package:modular_study/src/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        AsyncBind((i) => SharedPreferences.getInstance()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => SplashPage()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/products',
            module: ProductModule() /* guards: [AuthGuard()] */
            ),

        // Mais útil no Flutter Web, serve para quando o usuário tenta acessar
        // uma rota que não existe
        WildcardRoute(
            child: (_, __) => const Scaffold(
                body: Center(child: Text('Está página não existe!')))),
        //RedirectRoute(name, to: to)
      ];
}
