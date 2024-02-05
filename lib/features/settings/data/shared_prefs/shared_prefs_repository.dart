import 'package:batch_3_app/features/settings/data/local_storage_repository.dart';
import 'package:batch_3_app/features/settings/data/shared_prefs/shared_prefs_service.dart';

class SharedPrefsRepository implements LocalStorageRepository {
  final SharedPrefsService _sharedPrefsService;
  final Function(bool) _rebuildMaterialApp;
  SharedPrefsRepository(this._sharedPrefsService, this._rebuildMaterialApp);
  @override
  Future<bool> getIsDarkMode() {
    return _sharedPrefsService.getIsDarkmode();
  }

  @override
  Future<void> setThemeMode({required bool isDarkMode}) async {
    await _sharedPrefsService.setIsDarkmode(isDarkMode);
    _rebuildMaterialApp(
        isDarkMode); // identisch mit setState Aufruf in MaterialApp
  }
}
