import 'package:alfie/models/theme_color.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/settings_provider.dart';
import 'package:alfie/services/theme_service.dart';
import 'package:alfie/utils/string.dart';
import 'package:alfie/widgets/core/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppearancePage extends StatefulWidget {
  const AppearancePage({super.key});

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageService.translation(context).appearance),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.language_outlined,
                          color: Theme.of(context).colorScheme.primary,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          LanguageService.translation(context).changeLanguage,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Consumer<SettingsProvider>(
                      builder: (context, settingsProvider, child) => DropdownButton(
                        value: settingsProvider.settings.languageCode,
                        items: LanguageService.languagesList
                            .map((e) => DropdownMenuItem(value: e.languageCode, child: Text("${e.flag} ${e.name}")))
                            .toList(),
                        onChanged: (newLanguageCode) async {
                          if (newLanguageCode != null) {
                            await settingsProvider.updateLanguageCode(newLanguageCode);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(
                    children: [
                      Icon(
                        Icons.light_mode_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        LanguageService.translation(context).changeThemeMode,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Consumer<SettingsProvider>(
                    builder: (context, settingsProvider, child) => DropdownButton(
                      value: settingsProvider.settings.themeMode,
                      items: ThemeService.supportedThemeModes
                          .map((e) => DropdownMenuItem(value: e, child: Text(e.toTitleCase)))
                          .toList(),
                      onChanged: (newThemeMode) async {
                        if (newThemeMode != null) {
                          await settingsProvider
                              .updateThemeMode(ThemeService.getThemeModeFromEncodedString(newThemeMode));
                        }
                      },
                    ),
                  ),
                ]),
                const Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(
                    children: [
                      Icon(
                        Icons.color_lens_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        LanguageService.translation(context).changeThemeColor,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Consumer<SettingsProvider>(
                    builder: (context, settingsProvider, child) => ColorPicker(
                      includeWhiteColor: false,
                      selectedColor: settingsProvider.settings.themeColor.toThemeColor.toColor,
                      onColorChanged: (Color newThemeColor) async {
                        await settingsProvider.updateThemeColor(newThemeColor.toThemeColor);
                      },
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
