import 'package:alfie/models/theme_color.dart';
import 'package:alfie/services/settings_service.dart';
import 'package:flutter/material.dart';

class ThemeService {
  ThemeService._privateConstructor();

  static const String systemThemeMode = "system";
  static const String lightThemeMode = "light";
  static const String darkThemeMode = "dark";
  static const List<String> supportedThemeModes = [systemThemeMode, lightThemeMode, darkThemeMode];

  static const Color easyCardRatingColor = Colors.green;
  static const Color goodCardRatingColor = Colors.yellow;
  static const Color hardCardRatingColor = Colors.redAccent;

  static Future<void> updateThemeColor(ThemeColor? themeColor) async {
    await SettingsService.instance.updateThemeColor(themeColor ?? ThemeColor.blue);
  }

  static Future<void> updateThemeMode(ThemeMode? themeMode) async {
    await SettingsService.instance.updateThemeMode(themeMode ?? ThemeMode.system);
  }

  static ThemeData getLightThemeWithAccentColor(ThemeColor? accentColor) {
    switch (accentColor) {
      case ThemeColor.blue:
        return _lightBlueTheme;
      case ThemeColor.red:
        return _lightRedTheme;
      case ThemeColor.green:
        return _lightGreenTheme;
      case ThemeColor.yellow:
        return _lightYellowTheme;
      case ThemeColor.orange:
        return _lightOrangeTheme;
      case ThemeColor.purple:
        return _lightPurpleTheme;
      case ThemeColor.pink:
        return _lightPinkTheme;
      default:
        return _lightBlueTheme;
    }
  }

  static ThemeData getDarkThemeWithAccentColor(ThemeColor? accentColor) {
    switch (accentColor) {
      case ThemeColor.blue:
        return _darkBlueTheme;
      case ThemeColor.red:
        return _darkRedTheme;
      case ThemeColor.green:
        return _darkGreenTheme;
      case ThemeColor.yellow:
        return _darkYellowTheme;
      case ThemeColor.orange:
        return _darkOrangeTheme;
      case ThemeColor.purple:
        return _darkPurpleTheme;
      case ThemeColor.pink:
        return _darkPinkTheme;
      default:
        return _darkBlueTheme;
    }
  }

  static ThemeMode getThemeModeFromEncodedString(String? themeMode) {
    switch (themeMode) {
      case systemThemeMode:
        return ThemeMode.system;
      case lightThemeMode:
        return ThemeMode.light;
      case darkThemeMode:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  // light themes
  static final ThemeData _lightBlueTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueAccent,
      brightness: Brightness.light,
      primary: Colors.blueAccent,
      secondary: Colors.blueAccent.shade100,
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _lightRedTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.redAccent,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.redAccent,
      brightness: Brightness.light,
      primary: Colors.redAccent,
      secondary: Colors.redAccent.shade100,
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _lightGreenTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.greenAccent,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.greenAccent,
      brightness: Brightness.light,
      primary: Colors.greenAccent,
      secondary: Colors.greenAccent.shade100,
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _lightYellowTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.yellow.shade600,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.yellow.shade600,
      brightness: Brightness.light,
      primary: Colors.yellow.shade600,
      secondary: Colors.yellowAccent.shade100,
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _lightOrangeTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.orangeAccent,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.orangeAccent,
      brightness: Brightness.light,
      primary: Colors.orangeAccent,
      secondary: Colors.orangeAccent.shade100,
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _lightPurpleTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.purpleAccent,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purpleAccent,
      brightness: Brightness.light,
      primary: Colors.purpleAccent,
      secondary: Colors.purpleAccent.shade100,
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _lightPinkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.pinkAccent,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pinkAccent,
      brightness: Brightness.light,
      primary: Colors.pinkAccent,
      secondary: Colors.pinkAccent.shade100,
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );

  // dark themes
  static final ThemeData _darkBlueTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade700,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue.shade700,
      brightness: Brightness.dark,
      primary: Colors.blue.shade700,
      secondary: Colors.blue.shade200,
    ),
    iconTheme: const IconThemeData(color: Colors.white, opacity: .9),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black87,
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _darkRedTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red.shade700,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red.shade700,
      brightness: Brightness.dark,
      primary: Colors.red.shade700,
      secondary: Colors.red.shade200,
    ),
    iconTheme: const IconThemeData(color: Colors.white, opacity: .9),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black87,
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _darkGreenTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green.shade700,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green.shade700,
      brightness: Brightness.dark,
      primary: Colors.green.shade700,
      secondary: Colors.green.shade200,
    ),
    iconTheme: const IconThemeData(color: Colors.white, opacity: .9),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black87,
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _darkYellowTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.yellow.shade700,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.yellow.shade700,
      brightness: Brightness.dark,
      primary: Colors.yellow.shade700,
      secondary: Colors.yellow.shade200,
    ),
    iconTheme: const IconThemeData(color: Colors.white, opacity: .9),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black87,
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _darkOrangeTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.orange.shade700,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.orange.shade700,
      brightness: Brightness.dark,
      primary: Colors.orange.shade700,
      secondary: Colors.orange.shade200,
    ),
    iconTheme: const IconThemeData(color: Colors.white, opacity: .9),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black87,
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _darkPurpleTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple.shade700,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple.shade700,
      brightness: Brightness.dark,
      primary: Colors.purple.shade700,
      secondary: Colors.purple.shade200,
    ),
    iconTheme: const IconThemeData(color: Colors.white, opacity: .9),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black87,
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
  static final ThemeData _darkPinkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.pink.shade700,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink.shade700,
      brightness: Brightness.dark,
      primary: Colors.pink.shade700,
      secondary: Colors.pink.shade200,
    ),
    iconTheme: const IconThemeData(color: Colors.white, opacity: .9),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black87,
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    ),
    useMaterial3: true,
  );
}
