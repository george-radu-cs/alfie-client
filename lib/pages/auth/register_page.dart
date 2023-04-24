import 'package:alfie/api/grpc/grpc_client.dart';
import 'package:alfie/api/grpc/protobuf/alfie_api.pbgrpc.dart';
import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:alfie/services/users_service.dart';
import 'package:alfie/utils/validations.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  bool _loading = false;

  onEmailChanged(String newEmail) {
    setState(() => email = newEmail);
  }

  onPasswordChanged(String newPassword) {
    setState(() => password = newPassword);
  }

  onConfirmPasswordChanged(String newConfirmPassword) {
    setState(() => confirmPassword = newConfirmPassword);
  }

  onFirstNameChanged(String newFirstName) {
    setState(() => firstName = newFirstName);
  }

  onLastNameChanged(String newLastName) {
    setState(() => lastName = newLastName);
  }

  String? validateFirstName(String? value) {
    return !isNameValid(value) ? LanguageService.translation(context).invalidFirstName : null;
  }

  String? validateLastName(String? value) {
    return !isNameValid(value) ? LanguageService.translation(context).invalidLastName : null;
  }

  String? validateEmail(String? value) {
    return !isEmailValid(value) ? LanguageService.translation(context).invalidEmail : null;
  }

  String? validatePassword(String? value) {
    return !isPasswordValid(value) ? LanguageService.translation(context).invalidPassword : null;
  }

  String? validateConfirmPassword(String? value) {
    return !isConfirmPasswordValid(password, value) ? LanguageService.translation(context).passwordsDoNotMatch : null;
  }

  isFormValid() {
    final form = _formKey.currentState!;
    return form.validate();
  }

  onRegisterButtonPressed(UserProvider userProvider) async {
    if (!isFormValid()) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).invalidRegisterForm));
      return;
    }

    try {
      setState(() => _loading = true);
      var reply = await GrpcClient.instance.client.register(
        RegisterRequest(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        ),
      );

      await userProvider.setUserEmail(email);
      setState(() => _loading = false);
      if (context.mounted) {
        Navigator.of(context).pop(); // remove current page
        Navigator.of(context).pop(); // remove auth page
        Navigator.pushNamed(context, verifyUserRoute);
      }
    } catch (err) {
      setState(() => _loading = false);
      if (err.runtimeType != GrpcError) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).registerError));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
            _scaffoldKey, (err as GrpcError).message ?? LanguageService.translation(context).registerError));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text(LanguageService.translation(context).register)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        LanguageService.translation(context).createAnAccount,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: firstName,
                            onChanged: onFirstNameChanged,
                            validator: validateFirstName,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: LanguageService.translation(context).firstName,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            initialValue: lastName,
                            onChanged: onLastNameChanged,
                            validator: validateLastName,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: LanguageService.translation(context).lastName,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            initialValue: email,
                            onChanged: onEmailChanged,
                            validator: validateEmail,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: LanguageService.translation(context).email,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            initialValue: password,
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
                            initialValue: confirmPassword,
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Consumer<UserProvider>(
                        builder: (context, userProvider, child) => ElevatedButton(
                          onPressed: () => onRegisterButtonPressed(userProvider),
                          child: Text(LanguageService.translation(context).register),
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
