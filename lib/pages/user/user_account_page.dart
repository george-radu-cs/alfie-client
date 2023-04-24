import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:alfie/widgets/core/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({super.key});

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  logout(UserProvider userProvider) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        contentText: LanguageService.translation(context).logoutConfirmation,
        confirmFunctionCallback: () async {
          await userProvider.logout();
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  openUpdateUserInfoPage() {
    Navigator.pushNamed(context, updateUserInfoRoute);
  }

  openChangePasswordPage() {
    Navigator.pushNamed(context, changePasswordRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageService.translation(context).accountInfo),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(children: [
              Consumer<UserProvider>(
                builder: (context, userProvider, child) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.waving_hand_outlined,
                          size: 30,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .8,
                          child: Text(
                            "${LanguageService.translation(context).welcomeBack}, ${userProvider.user.firstName} ${userProvider.user.lastName}",
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )),
              ),
              const Divider(),
              TextButton(
                onPressed: openUpdateUserInfoPage,
                child: Row(
                  children: [
                    Icon(Icons.manage_accounts_outlined, size: 30, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 10),
                    Text(LanguageService.translation(context).updateUserInfo),
                  ],
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: openChangePasswordPage,
                child: Row(
                  children: [
                    Icon(Icons.password_outlined, size: 30, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 10),
                    Text(LanguageService.translation(context).changePassword),
                  ],
                ),
              ),
              const Divider(),
              Consumer<UserProvider>(
                builder: (context, userProvider, child) => TextButton(
                  onPressed: () => logout(userProvider),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 10),
                      Text(LanguageService.translation(context).logout)
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
