abstract class LocalStorageRepository {
  Future<void> setThemeMode({required bool isDarkMode});
  Future<bool> getIsDarkMode();
}
