import 'package:alfie/pages/auth/auth_page.dart';
import 'package:alfie/pages/auth/login_2fa_page.dart';
import 'package:alfie/pages/auth/login_page.dart';
import 'package:alfie/pages/auth/verify_user_page.dart';
import 'package:alfie/pages/user/user_account_page.dart';
import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      /// token is not empty
      // show page with user info, edit options, logout button
      if (userProvider.user.token != null && userProvider.user.token!.isNotEmpty) {
        return const UserAccountPage();
      }

      /// user didn't register/login yet
      // show page about alfie account + register/login buttons for pages
      if (userProvider.user.email.isEmpty) {
        return const AuthPage();
      }

      /// email is not empty and verified is set to false
      // show page about verify email to confirm alfie account
      // + button in case of error validation to resend(needs email + password for this)
      if (!userProvider.user.verified) {
        return const VerifyUserPage();
      }

      /// email is not empty, account is verified, canCheck2FA is false
      // show login page with email completed, require password
      if (!userProvider.user.loginCanCheck2FA) {
        return const LoginPage();
      }

      /// email is not empty, account verified, canCheck2FA is true
      // show page to send 2FA code + go back to login page in case invalid
      // return;
      return const Login2FAPage();
    });
  }
}
