import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/utils/about_info.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  openExternalUrl(String url) async {
    final parsedURI = Uri.parse(url);
    if (!await launchUrl(parsedURI)) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).couldNotOpenLink + url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text(LanguageService.translation(context).about)),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(children: [
              TextButton(
                onPressed: () => Navigator.pushNamed(context, appExplicationRoute),
                child: Row(children: [
                  Icon(
                    Icons.question_mark_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    LanguageService.translation(context).whatIsThisApp,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
              ),
              const Divider(),
              TextButton(
                onPressed: () => openExternalUrl(clientSourceCode),
                child: Row(children: [
                  Icon(
                    Icons.code_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    LanguageService.translation(context).clientSourceCode,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
              ),
              const Divider(),
              TextButton(
                onPressed: () => openExternalUrl(clientSourceCode),
                child: Row(children: [
                  Icon(
                    Icons.code_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    LanguageService.translation(context).cloudServicesSourceCode,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
              ),
              const Divider(),
              TextButton(
                onPressed: () => openExternalUrl(markdownHelpLink),
                child: Row(children: [
                  Icon(
                    Icons.school_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    LanguageService.translation(context).howToUseMarkdown,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
              ),
              const Divider(),
              TextButton(
                onPressed: () => openExternalUrl(mathInTexHelpLink),
                child: Row(children: [
                  Icon(
                    Icons.school_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    LanguageService.translation(context).howToWriteMathInTex,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
              ),
              const Divider(),
              TextButton(
                onPressed: () => openExternalUrl(htmlHelpLink),
                child: Row(children: [
                  Icon(
                    Icons.school_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    LanguageService.translation(context).howToUseHTML,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
              ),
              const Divider(),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, termsOfUserAndPrivacyPolicyRoute),
                child: Row(children: [
                  Icon(
                    Icons.question_mark_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    LanguageService.translation(context).termsOfUseAndPrivacyPolicy,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
