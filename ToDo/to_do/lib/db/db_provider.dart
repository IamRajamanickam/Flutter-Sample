import 'package:shared_preferences/shared_preferences.dart';

class DBHandler {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List<String>> loadData(String key) async {
    SharedPreferences preferences = await _prefs;

    Future<List<String>> todos = _prefs.then((SharedPreferences prefs) {
      return (preferences.getStringList(key) ?? List.empty(growable: true));
    });

    return todos;
  }

  Future<bool> saveData(String key, List<String> value) async {
    SharedPreferences preferences = await _prefs;
    return _prefs.then((SharedPreferences prefs) {
      return preferences.setStringList(key, value);
    });
  }
}
