import 'package:alfie/models/theme_color.dart';
import 'package:alfie/models/settings.dart';
import 'package:alfie/repositories/settings_repository.dart';
import 'package:flutter/material.dart';

class SettingsService {
  SettingsService._privateConstructor();
  static final SettingsService instance = SettingsService._privateConstructor();

  static final SettingsRepository _settingsRepository = SettingsRepository.instance;

  Future<Settings> getSettings() async {
    return await _settingsRepository.getSettings();
  }

  Future<void> updateSettings(Settings settings) async {
    await _settingsRepository.updateSettings(settings);
  }

  Future<void> updateLanguageCode(String languageCode) async {
    await _settingsRepository.updateLanguageCode(languageCode);
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await _settingsRepository.updateThemeMode(themeMode.name);
  }

  Future<void> updateThemeColor(ThemeColor themeColor) async {
    await _settingsRepository.updateThemeColor(themeColor.name);
  }

  Future<void> updateShowOCRDialog(bool showOCRDialog) async {
    await _settingsRepository.updateShowOCRDialog(showOCRDialog);
  }
}
