import 'package:shared_preferences/shared_preferences.dart';

const _isDarkModeKey = 'isDarkMode';

class SharedPrefsService {
  Future<void> setIsDarkmode(bool darkMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isDarkModeKey, darkMode);
  }

  Future<bool> getIsDarkmode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isDarkModeKey) ?? false;
  }
}
