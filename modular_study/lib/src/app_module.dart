import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_study/src/modules/auth/auth_module.dart';
import 'package:modular_study/src/modules/auth/guards/auth_guard.dart';
import 'package:modular_study/src/modules/product/product_module.dart';
import 'package:modular_study/src/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => SplashPage()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute(
          '/products',
          module: ProductModule(), /* guards: [AuthGuard()] */
        ),
      ];
}
