import 'package:alfie/models/settings.dart';
import 'package:alfie/repositories/database.dart';

class SettingsRepository {
  SettingsRepository._privateConstructor();
  static final SettingsRepository instance = SettingsRepository._privateConstructor();

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  final String _settingsTableName = 'settings';
  final int _settingsId = 1;

  Future<Settings> getSettings() async {
    var db = await _databaseHelper.database;
    return await db.query(_settingsTableName).then((value) => Settings.fromMap(value.first));
  }

  Future<void> updateSettings(Settings settings) async {
    var db = await _databaseHelper.database;
    await db.update(_settingsTableName, settings.toMap(), where: 'id = ?', whereArgs: [settings.id]);
  }

  Future<void> updateLanguageCode(String languageCode) async {
    var db = await _databaseHelper.database;
    await db.update(_settingsTableName, {'languageCode': languageCode}, where: 'id = ?', whereArgs: [_settingsId]);
  }

  Future<void> updateThemeMode(String themeMode) async {
    var db = await _databaseHelper.database;
    await db.update(_settingsTableName, {'themeMode': themeMode}, where: 'id = ?', whereArgs: [_settingsId]);
  }

  Future<void> updateThemeColor(String themeColor) async {
    var db = await _databaseHelper.database;
    await db.update(_settingsTableName, {'themeColor': themeColor}, where: 'id = ?', whereArgs: [_settingsId]);
  }

  Future<void> updateShowOCRDialog(bool showOCRDialog) async {
    var db = await _databaseHelper.database;
    await db.update(_settingsTableName, {'showOCRDialog': showOCRDialog ? 1 : 0},
        where: 'id = ?', whereArgs: [_settingsId]);
  }
}
