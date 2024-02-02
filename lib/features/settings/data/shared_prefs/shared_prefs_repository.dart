import 'package:batch_3_app/features/settings/data/local_storage_repository.dart';
import 'package:batch_3_app/features/settings/data/shared_prefs/shared_prefs_service.dart';

class SharedPrefsRepository implements LocalStorageRepository {
  final SharedPrefsService _sharedPrefsService;

  SharedPrefsRepository(this._sharedPrefsService);
  @override
  Future<bool> getIsDarkMode() {
    return _sharedPrefsService.getIsDarkmode();
  }

  @override
  Future<void> setThemeMode({required bool isDarkMode}) {
    return _sharedPrefsService.setIsDarkmode(isDarkMode);
  }
}
