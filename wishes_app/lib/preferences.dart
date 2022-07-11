import 'package:shared_preferences/shared_preferences.dart';

class Mypreferences {
  static const listKey = 'listKey';

  static SharedPreferences? _preferences;
  static inti() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static Future saveWishes(List<String> wishesList) async {
    _preferences!.setStringList('listKey', wishesList);
  }

  static List<String> fetchWishes() =>
      _preferences!.getStringList("listKey") ?? [];

  static Future deleteWishes(List<String> wishesList) async {
    _preferences!.remove('listKey');
  }
}
