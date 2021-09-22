import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/shared/repositories/localStorage/local_storage_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final ILocalStorage _storage = Modular.get();

  @observable
  String text = '';

  @action
  setText(String value) => text = value;

  @observable
  ObservableList<String> list = <String>[].asObservable();

  HomeControllerBase() {
    init();
  }

  @action
  init() async {
    List<String>? listLocal = await _storage.get('list');

    if (listLocal == null) {
      list = <String>[].asObservable();
    } else
      list = listLocal.asObservable();
  }

  @action
  void save() {
    list.add(text);
    _storage.put('list', list);
  }

  @action
  void remove(int index) {
    list.removeAt(index);
    _storage.put('list', list);
  }
}
