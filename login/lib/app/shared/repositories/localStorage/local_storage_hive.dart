import 'dart:async';

import 'package:hive/hive.dart';
import 'package:login/app/shared/repositories/localStorage/local_storage_interface.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageHive implements ILocalStorage {
  Completer<Box> _instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    var box = await Hive.openBox('db');
    _instance.complete(box);
  }

  LocalStorageHive() {
    _init();
  }

  @override
  Future delete(String key) async {
    var box = await _instance.future;
    box.delete(key);
  }

  @override
  Future<List<String>> get(String key) async {
    var box = await _instance.future;
    return box.get(key);
  }

  @override
  Future put(String key, List<String> value) async {
    var box = await _instance.future;
    box.put(key, value);
  }
}
