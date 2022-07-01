import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesDataSource {
  Future<void> persistAppLocale(String languageCode);

  Future<void> persistAppThemeMode(int themeMode);

  String? get locale;

  int? get themeMode;
}

class PreferencesDataSourceImpl implements PreferencesDataSource {
  PreferencesDataSourceImpl(this.preferences);

  final SharedPreferences preferences;

  @override
  Future<void> persistAppLocale(String languageCode) =>
      preferences.setString('locale', languageCode);

  @override
  String? get locale => preferences.getString('locale');

  @override
  Future<void> persistAppThemeMode(int themeMode) =>
      preferences.setInt('themeMode', themeMode);

  @override
  int? get themeMode => preferences.getInt('themeMode');
}
