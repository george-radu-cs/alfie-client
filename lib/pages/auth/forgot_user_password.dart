import 'package:alfie/api/grpc/grpc_client.dart';
import 'package:alfie/api/grpc/protobuf/alfie_api.pb.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:alfie/utils/validations.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class ForgotUserPasswordPage extends StatefulWidget {
  const ForgotUserPasswordPage({super.key});

  @override
  State<ForgotUserPasswordPage> createState() => _ForgotUserPasswordPageState();
}

class _ForgotUserPasswordPageState extends State<ForgotUserPasswordPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final pinCodeLength = 6;
  String email = "";
  String code = "";
  String newPassword = "";
  String confirmNewPassword = "";
  bool _loading = false;
  bool _sentCode = false;

  onEmailChanged(String newEmail) {
    setState(() => email = newEmail);
  }

  onPasswordChanged(String value) {
    setState(() => newPassword = value);
  }

  onConfirmPasswordChanged(String newConfirmPassword) {
    setState(() => confirmNewPassword = newConfirmPassword);
  }

  String? validateEmail(String? value) {
    return !isEmailValid(value) ? LanguageService.translation(context).invalidEmail : null;
  }

  String? validatePassword(String? value) {
    return !isPasswordValid(value) ? LanguageService.translation(context).invalidPassword : null;
  }

  String? validateConfirmPassword(String? value) {
    return !isConfirmPasswordValid(newPassword, value)
        ? LanguageService.translation(context).passwordsDoNotMatch
        : null;
  }

  isFormValid() {
    final form = _formKey.currentState!;
    return code.length == pinCodeLength && form.validate();
  }

  sendRessetPasswordCode() async {
    if (!isEmailValid(email)) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).invalidEmail));
      return;
    }

    try {
      setState(() => _loading = true);
      var reply = await GrpcClient.instance.client.forgotPassword(ForgotPasswordRequest(email: email));

      setState(() => _loading = false);
      setState(() => _sentCode = true);
    } catch (err) {
      setState(() => _loading = false);
      if (err.runtimeType != GrpcError) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).forgotPasswordSendMailError));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(_scaffoldKey,
            (err as GrpcError).message ?? LanguageService.translation(context).forgotPasswordSendMailError));
      }
    }
  }

  onResetPassword(UserProvider userProvider) async {
    if (!isFormValid()) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).invalidForm));
      return;
    }

    try {
      setState(() => _loading = true);
      var reply = await GrpcClient.instance.client.resetPassword(
        ResetPasswordRequest(
          email: email,
          code: code,
          password: newPassword,
        ),
      );

      setState(() => _loading = false);
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).passwordUpdatedSuccess));
      Navigator.of(context).pop();
    } catch (err) {
      setState(() => _loading = false);
      if (err.runtimeType != GrpcError) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).resetPasswordError));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
            _scaffoldKey, (err as GrpcError).message ?? LanguageService.translation(context).resetPasswordError));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(LanguageService.translation(context).forgotYourPassword),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: SingleChildScrollView(
                  child: !_sentCode
                      ? Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(LanguageService.translation(context).enterYourEmailToResetYourPassword),
                          ),
                          const SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              initialValue: email,
                              onChanged: onEmailChanged,
                              validator: validateEmail,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: LanguageService.translation(context).email,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: sendRessetPasswordCode,
                              child: Text(LanguageService.translation(context).sendCode),
                            ),
                          ),
                        ])
                      : Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(LanguageService.translation(context).forgotPasswordCodeSent),
                          ),
                          const SizedBox(height: 20),
                          Pinput(
                            length: pinCodeLength,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(pinCodeLength)
                            ],
                            onChanged: (value) => setState(() => code = value),
                            defaultPinTheme: PinTheme(
                              width: 48,
                              height: 48,
                              textStyle: Theme.of(context).textTheme.titleLarge,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary.withAlpha(170),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            child: Column(children: [
                              TextFormField(
                                initialValue: newPassword,
                                onChanged: onPasswordChanged,
                                validator: validatePassword,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: LanguageService.translation(context).password,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                initialValue: confirmNewPassword,
                                onChanged: onConfirmPasswordChanged,
                                validator: validateConfirmPassword,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: LanguageService.translation(context).confirmPassword,
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: Consumer<UserProvider>(
                              builder: (context, userProvider, child) => ElevatedButton(
                                onPressed: () => onResetPassword(userProvider),
                                child: Text(LanguageService.translation(context).resetPassword),
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
