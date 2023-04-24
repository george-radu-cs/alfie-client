import 'package:alfie/classes/create_edit_card_page_arguments.dart';
import 'package:alfie/classes/create_edit_deck_page_arguments.dart';
import 'package:alfie/classes/study_deck_page_arguments.dart';
import 'package:alfie/classes/view_deck_page_arguments.dart';
import 'package:alfie/pages/alfie_main_page.dart';
import 'package:alfie/pages/auth/auth_page.dart';
import 'package:alfie/pages/auth/forgot_user_password.dart';
import 'package:alfie/pages/auth/login_2fa_page.dart';
import 'package:alfie/pages/auth/login_page.dart';
import 'package:alfie/pages/auth/register_page.dart';
import 'package:alfie/pages/auth/resend_verify_user_page.dart';
import 'package:alfie/pages/auth/verify_user_page.dart';
import 'package:alfie/pages/deck/study_deck_page.dart';
import 'package:alfie/pages/deck/view_deck_page.dart';
import 'package:alfie/pages/deck_card/create_edit_deck_card_page.dart';
import 'package:alfie/pages/not_found_page.dart';
import 'package:alfie/pages/settings/about_page.dart';
import 'package:alfie/pages/settings/account_page.dart';
import 'package:alfie/pages/settings/app_purpose_page.dart';
import 'package:alfie/pages/settings/appearance_page.dart';
import 'package:alfie/pages/settings/backup_page.dart';
import 'package:alfie/pages/settings/statistics_page.dart';
import 'package:alfie/pages/settings/terms_of_use_and_privacy_page.dart';
import 'package:alfie/pages/user/change_password_page.dart';
import 'package:alfie/pages/user/update_user_info_page.dart';
import 'package:alfie/pages/user/user_account_page.dart';
import 'package:flutter/material.dart';
import 'package:alfie/router/router_constants.dart';
import 'package:alfie/pages/deck/create_edit_deck_page.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const AlfieMainPage());

      // decks routes
      case createDeckRoute:
        CreateEditDeckPageArguments arguments = args as CreateEditDeckPageArguments;
        return MaterialPageRoute(
            builder: (_) => CreateEditDeckPage(
                  groupId: arguments.groupId,
                  deck: null,
                  closeWidgetCallback: arguments.closeWidgetCallback,
                ));
      case viewDeckRoute:
        ViewDeckPageArguments arguments = args as ViewDeckPageArguments;
        return MaterialPageRoute(
            builder: (_) => ViewDeckPage(
                  deckId: arguments.deckId,
                  closeWidgetCallback: arguments.closeWidgetCallback,
                ));
      case editDeckRoute:
        CreateEditDeckPageArguments arguments = args as CreateEditDeckPageArguments;
        return MaterialPageRoute(
            builder: (_) => CreateEditDeckPage(
                  groupId: arguments.groupId,
                  deck: arguments.deck,
                  closeWidgetCallback: arguments.closeWidgetCallback,
                ));
      case studyDeckRoute:
        StudyDeckPageArguments arguments = args as StudyDeckPageArguments;
        return MaterialPageRoute(
            builder: (_) => StudyDeckPage(
                  deckId: arguments.deckId,
                  closeWidgetCallback: arguments.closeWidgetCallback,
                ));
      case addDeckCardRoute:
        CreateEditDeckCardPageArguments arguments = args as CreateEditDeckCardPageArguments;
        return MaterialPageRoute(
            builder: (_) => CreateEditDeckCardPage(
                  deckId: arguments.deckId,
                  deckCard: null,
                  closeWidgetCallback: arguments.closeWidgetCallback,
                ));
      case editDeckCardRoute:
        CreateEditDeckCardPageArguments arguments = args as CreateEditDeckCardPageArguments;
        return MaterialPageRoute(
            builder: (_) => CreateEditDeckCardPage(
                  deckId: arguments.deckId,
                  deckCard: arguments.deckCard,
                  closeWidgetCallback: arguments.closeWidgetCallback,
                ));

      // settings routes
      case accountSettingsRoute:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case appearanceSettingsRoute:
        return MaterialPageRoute(builder: (_) => const AppearancePage());
      case backupSettingsRoute:
        return MaterialPageRoute(builder: (_) => const BackupPage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case appExplicationRoute:
        return MaterialPageRoute(builder: (_) => const AppPurposePage());
      case statisticsRoute:
        return MaterialPageRoute(builder: (_) => const StatisticsPage());
      case termsOfUserAndPrivacyPolicyRoute:
        return MaterialPageRoute(builder: (_) => const TermsOfUseAndPrivacyPolicyPage());

      // auth & user routes
      case authRoute:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case verifyUserRoute:
        return MaterialPageRoute(builder: (_) => const VerifyUserPage());
      case resendVerifyUserRoute:
        return MaterialPageRoute(builder: (_) => const ResendVerifyUserPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case login2FAStepRoute:
        return MaterialPageRoute(builder: (_) => const Login2FAPage());
      case forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotUserPasswordPage());
      case userAccountRoute:
        return MaterialPageRoute(builder: (_) => const UserAccountPage());
      case updateUserInfoRoute:
        return MaterialPageRoute(builder: (_) => const UpdateUserInfoPage());
      case changePasswordRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordPage());

      // market routes

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
