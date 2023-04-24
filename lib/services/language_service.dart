import 'package:alfie/services/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:alfie/classes/language.dart';

class LanguageService {
  LanguageService._privateConstructor();

  static const String englishCode = "en";
  static const String romanianCode = "ro";
  static const List<String> supportedLanguagesCodes = [englishCode, romanianCode];
  static const List<Language> languagesList = [
    Language(1, "🇬🇧", "English", englishCode),
    Language(2, "🇷🇴", "Română", romanianCode)
  ];

  static Future<void> updateLanguageCode(String? languageCode) async {
    if (languageCode == null || !supportedLanguagesCodes.contains(languageCode)) {
      languageCode = englishCode;
    }
    await SettingsService.instance.updateLanguageCode(languageCode);
  }

  static Locale getLocaleFromLangaugeCode(String? languageCode) {
    if (languageCode == null || !supportedLanguagesCodes.contains(languageCode)) {
      languageCode = englishCode;
    }
    return Locale(languageCode, "");
  }

  // cleaner call to get the current translation of a text
  static AppLocalizations translation(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}
