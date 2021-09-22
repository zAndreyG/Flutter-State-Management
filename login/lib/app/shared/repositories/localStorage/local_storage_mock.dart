import 'package:login/app/shared/repositories/localStorage/local_storage_interface.dart';

class LocalStorageMock implements ILocalStorage {
  List<String> storage = [];

  @override
  Future delete(String key) {
    throw UnimplementedError();
  }

  @override
  Future<List<String>?> get(String key) async {
    return storage;
  }

  @override
  Future put(String key, List<String> value) async {
    storage = value;
  }
}
