import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/language_service.dart';
import 'package:flutter/material.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  openMenuSettings(String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextButton(
                  onPressed: () => openMenuSettings(accountSettingsRoute),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        LanguageService.translation(context).account,
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () => openMenuSettings(appearanceSettingsRoute),
                  child: Row(
                    children: [
                      Icon(
                        Icons.style_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        LanguageService.translation(context).appearance,
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () => openMenuSettings(backupSettingsRoute),
                  child: Row(
                    children: [
                      Icon(
                        Icons.backup_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        LanguageService.translation(context).backupAndStorage,
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () => openMenuSettings(statisticsRoute),
                  child: Row(
                    children: [
                      Icon(
                        Icons.auto_graph_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        LanguageService.translation(context).statistics,
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () => openMenuSettings(aboutRoute),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Theme.of(context).colorScheme.primary,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        LanguageService.translation(context).about,
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
