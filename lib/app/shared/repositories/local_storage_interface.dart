abstract class ILocalStorage {
  Future getValue(String key);

  Future<void> setValue(String key, dynamic data);

  Future getBool(String key);

  Future<void> setBool(String key, dynamic data);

  Future deleteValue(String key);
}
