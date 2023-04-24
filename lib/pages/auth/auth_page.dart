import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/language_service.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  goToLoginPage() {
    Navigator.of(context).pushNamed(loginRoute);
  }

  goToRegisterPage() {
    Navigator.of(context).pushNamed(registerRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text(LanguageService.translation(context).account)),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: [
                Text(
                  LanguageService.translation(context).whyUseAnAccount,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 30),
                Text(
                  LanguageService.translation(context).whyUseAnAccountReason,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child:
                      ElevatedButton(onPressed: goToLoginPage, child: Text(LanguageService.translation(context).login)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageService.translation(context).dontHaveAnAccount,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 10),
                    TextButton(onPressed: goToRegisterPage, child: Text(LanguageService.translation(context).register)),
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
