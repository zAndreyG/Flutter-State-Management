import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/app/app_module.dart';
import 'package:login/app/modules/home/home_controller.dart';
import 'package:login/app/modules/home/home_module.dart';
import 'package:login/app/shared/repositories/localStorage/local_storage_interface.dart';
import 'package:login/app/shared/repositories/localStorage/local_storage_mock.dart';
import 'package:modular_test/modular_test.dart';

main() {
  initModules([
    AppModule(),
    HomeModule(),
  ], replaceBinds: [
    // Mock é uma classe "fake" utilizada para testar funcionaliades sem
    // ser necessário acessar o SharedPreferences/Hive
    Bind<ILocalStorage>((i) => LocalStorageMock()),
  ]);

  test('click save', () async {
    final HomeController controller = Modular.get();
    controller.text = 'Andrey';
    controller.save();
    expect(controller.list.length, 1);
    expect(controller.list[0], 'Andrey');

    List<String>? listStorage = await Modular.get<ILocalStorage>().get('key');
    expect(listStorage![0], 'Andrey');
  });

  test('click remove', () async {
    final HomeController controller = Modular.get();
    controller.text = 'Andrey';
    // Adiciona um item à lista
    controller.save();

    controller.remove(0);
    expect(controller.list.length, 0);

    List<String>? listStorage = await Modular.get<ILocalStorage>().get('key');
    expect(listStorage!.isEmpty, true);
  });
}
