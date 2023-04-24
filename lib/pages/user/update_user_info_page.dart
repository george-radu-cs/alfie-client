import 'package:alfie/api/grpc/grpc_client.dart';
import 'package:alfie/api/grpc/protobuf/alfie_api.pb.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:alfie/utils/validations.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';

class UpdateUserInfoPage extends StatefulWidget {
  const UpdateUserInfoPage({super.key});

  @override
  State<UpdateUserInfoPage> createState() => _UpdateUserInfoPageState();
}

class _UpdateUserInfoPageState extends State<UpdateUserInfoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String firstName = "";
  String lastName = "";
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    firstName = context.read<UserProvider>().user.firstName;
    lastName = context.read<UserProvider>().user.lastName;
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

  isFormValid() {
    final form = _formKey.currentState!;
    return form.validate();
  }

  updateUserInfo(UserProvider userProvider) async {
    if (!isFormValid()) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).invalidForm));
      return;
    }

    try {
      setState(() => _loading = true);
      var reply = await GrpcClient.instance.client.updateUserInfo(
        UpdateUserInfoRequest(
          firstName: firstName,
          lastName: lastName,
        ),
        options: getCallOptionsWithAuthorization(userProvider),
      );

      await userProvider.updateUser(userProvider.user.copyWith(firstName: firstName, lastName: lastName));

      setState(() => _loading = false);
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).updateUserInfoSuccessfully));
    } catch (err) {
      setState(() => _loading = false);
      if (err.runtimeType != GrpcError) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).updateUserInfoError));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
            _scaffoldKey, (err as GrpcError).message ?? LanguageService.translation(context).updateUserInfoError));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(LanguageService.translation(context).updateUserInfo),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Form(
                        key: _formKey,
                        child: Column(children: [
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
                        ]),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: Consumer<UserProvider>(
                          builder: (context, userProvider, child) => ElevatedButton(
                            onPressed: () => updateUserInfo(userProvider),
                            child: Text(LanguageService.translation(context).updateInfo),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
