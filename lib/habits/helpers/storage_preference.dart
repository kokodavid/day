import 'package:shared_preferences/shared_preferences.dart';

class StoragePreference {
  static const String key = "storage_option";

  static Future<void> setPreference(String option) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, option);
  }

  static Future<String?> getPrefrence()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? 'local';
  }
}