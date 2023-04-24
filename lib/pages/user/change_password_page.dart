import 'package:alfie/api/grpc/grpc_client.dart';
import 'package:alfie/api/grpc/protobuf/alfie_api.pb.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:alfie/utils/validations.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String oldPassword = "";
  String newPassword = "";
  String confirmNewPassword = "";
  bool _loading = false;

  onOldPasswordChanged(String value) {
    setState(() => oldPassword = value);
  }

  onNewPasswordChanged(String value) {
    setState(() => newPassword = value);
  }

  onConfirmNewPasswordChanged(String value) {
    setState(() => confirmNewPassword = value);
  }

  String? validateNewPassword(String? value) {
    return !isPasswordValid(value) ? LanguageService.translation(context).invalidPassword : null;
  }

  String? validateConfirmNewPassword(String? value) {
    return !isConfirmPasswordValid(newPassword, value)
        ? LanguageService.translation(context).passwordsDoNotMatch
        : null;
  }

  isFormValid() {
    final form = _formKey.currentState!;
    return form.validate();
  }

  onUpdateUserPasswordButtonPressed(UserProvider userProvider) async {
    if (!isFormValid()) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).invalidRegisterForm));
      return;
    }

    try {
      setState(() => _loading = true);
      var reply = await GrpcClient.instance.client.updatePassword(
        UpdatePasswordRequest(
          oldPassword: oldPassword,
          newPassword: newPassword,
        ),
        options: getCallOptionsWithAuthorization(userProvider),
      );

      setState(() => _loading = false);
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).passwordUpdatedSuccess));
      if (context.mounted) {
        Navigator.of(context).pop();
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
      appBar: AppBar(
        title: Text(LanguageService.translation(context).changePassword),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  Flexible(
                    flex: 3,
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        TextFormField(
                          initialValue: oldPassword,
                          onChanged: onOldPasswordChanged,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: LanguageService.translation(context).yourOldPassword,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          initialValue: newPassword,
                          onChanged: onNewPasswordChanged,
                          validator: validateNewPassword,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: LanguageService.translation(context).newPassword,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          initialValue: confirmNewPassword,
                          onChanged: onConfirmNewPasswordChanged,
                          validator: validateConfirmNewPassword,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: LanguageService.translation(context).confirmNewPassword,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: Consumer<UserProvider>(
                        builder: (context, userProvider, child) => ElevatedButton(
                          onPressed: () => onUpdateUserPasswordButtonPressed(userProvider),
                          child: Text(LanguageService.translation(context).updatePassword),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
    );
  }
}
