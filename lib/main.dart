import 'package:alfie/api/grpc/grpc_client.dart';
import 'package:alfie/models/theme_color.dart';
import 'package:alfie/services/settings_provider.dart';
import 'package:alfie/services/theme_service.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:alfie/router/custom_router.dart';
import 'package:alfie/pages/alfie_main_page.dart';
import 'package:alfie/services/language_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await GrpcClient.instance.init();

  SettingsProvider settingsProvider = await SettingsProvider.init();
  UserProvider userProvider = await UserProvider.init();
  runApp(Alfie(
    settingsProvider: settingsProvider,
    userProvider: userProvider,
  ));

  FlutterNativeSplash.remove();
}

class Alfie extends StatefulWidget {
  final SettingsProvider settingsProvider;
  final UserProvider userProvider;
  const Alfie({super.key, required this.settingsProvider, required this.userProvider});

  @override
  State<Alfie> createState() => _AlfieState();
}

class _AlfieState extends State<Alfie> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(create: (_) => widget.settingsProvider),
        ChangeNotifierProvider<UserProvider>(create: (_) => widget.userProvider),
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeService.getLightThemeWithAccentColor(
            Provider.of<SettingsProvider>(context).settings.themeColor.toThemeColor,
          ),
          darkTheme: ThemeService.getDarkThemeWithAccentColor(
            Provider.of<SettingsProvider>(context).settings.themeColor.toThemeColor,
          ),
          themeMode: ThemeService.getThemeModeFromEncodedString(
            Provider.of<SettingsProvider>(context).settings.themeMode,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: CustomRouter.generatedRoute,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: LanguageService.getLocaleFromLangaugeCode(
            Provider.of<SettingsProvider>(context).settings.languageCode,
          ),
          home: const AlfieMainPage(),
        );
      },
    );
  }
}
