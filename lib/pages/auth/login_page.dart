import 'package:alfie/api/grpc/grpc_client.dart';
import 'package:alfie/api/grpc/protobuf/alfie_api.pb.dart';
import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:alfie/utils/validations.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _loading = false;

  onEmailChanged(String newEmail) {
    setState(() => email = newEmail);
  }

  onPasswordChanged(String newPassword) {
    setState(() => password = newPassword);
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !isEmailValid(value)) {
      return LanguageService.translation(context).invalidEmail;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LanguageService.translation(context).emptyPassword;
    }
    return null;
  }

  isFormValid() {
    final form = _formKey.currentState!;
    return form.validate();
  }

  onLoginButtonPressed(UserProvider userProvider) async {
    if (!isFormValid()) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).invalidLoginForm));
      return;
    }

    try {
      setState(() => _loading = true);
      var reply = await GrpcClient.instance.client.login(
        LoginRequest(
          email: email,
          password: password,
        ),
      );

      await userProvider.setUserCanCheck2FALogin(email);
      setState(() => _loading = false);

      if (context.mounted) {
        Navigator.of(context).pop(); // remove current page
        Navigator.pushNamed(context, login2FAStepRoute);
      }
    } catch (err) {
      setState(() => _loading = false);
      if (err.runtimeType != GrpcError) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).loginError));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
            _scaffoldKey, (err as GrpcError).message ?? LanguageService.translation(context).loginError));
      }
    }
  }

  onForgotYourPasswordPressed() {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, forgotPasswordRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text(LanguageService.translation(context).login)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        LanguageService.translation(context).loginToYourAccount,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: email,
                            onChanged: onEmailChanged,
                            validator: validateEmail,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: LanguageService.translation(context).email,
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            initialValue: password,
                            onChanged: onPasswordChanged,
                            validator: validatePassword,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: LanguageService.translation(context).password,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Consumer<UserProvider>(
                            builder: (context, userProvider, child) => ElevatedButton(
                              onPressed: () => onLoginButtonPressed(userProvider),
                              child: Text(LanguageService.translation(context).login),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: onForgotYourPasswordPressed,
                            child: Text(LanguageService.translation(context).forgotYourPassword),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
    );
  }
}
