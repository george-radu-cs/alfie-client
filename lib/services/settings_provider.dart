import 'package:alfie/models/settings.dart';
import 'package:alfie/models/theme_color.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/settings_service.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  late Settings _settings;
  Settings get settings => _settings;

  SettingsProvider._privateConstructor();

  static Future<SettingsProvider> init() async {
    SettingsProvider provider = SettingsProvider._privateConstructor();
    await provider.refreshSettings();
    return provider;
  }

  Future<void> refreshSettings() async {
    _settings = await SettingsService.instance.getSettings();
    notifyListeners();
  }

  Future<void> updateLanguageCode(String languageCode) async {
    await LanguageService.updateLanguageCode(languageCode);
    await refreshSettings();
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await SettingsService.instance.updateThemeMode(themeMode);
    await refreshSettings();
  }

  Future<void> updateThemeColor(ThemeColor themeColor) async {
    await SettingsService.instance.updateThemeColor(themeColor);
    await refreshSettings();
  }

  Future<void> updateShowOCRDialog(bool showOCRDialog) async {
    await SettingsService.instance.updateShowOCRDialog(showOCRDialog);
    await refreshSettings();
  }
}
