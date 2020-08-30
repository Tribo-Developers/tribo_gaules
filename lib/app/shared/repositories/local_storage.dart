import 'package:shared_preferences/shared_preferences.dart';
import 'local_storage_interface.dart';

class LocalStorage implements ILocalStorage {
  @override
  Future getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> setValue(String key, data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key.toString(), data.toString());
  }

  @override
  Future getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  @override
  Future<void> setBool(String key, data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, data);
  }

  @override
  Future deleteValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
