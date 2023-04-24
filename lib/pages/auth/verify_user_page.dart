import 'package:alfie/api/grpc/grpc_client.dart';
import 'package:alfie/api/grpc/protobuf/alfie_api.pb.dart';
import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyUserPage extends StatefulWidget {
  const VerifyUserPage({super.key});

  @override
  State<VerifyUserPage> createState() => _VerifyUserPageState();
}

class _VerifyUserPageState extends State<VerifyUserPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final pinCodeLength = 6;
  String pinCode = "";
  bool _loading = false;

  onManualVerifyUser(UserProvider userProvider) async {
    if (pinCode.length != pinCodeLength) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).fillTheVerificationCode));
      return;
    }
    await verifyUser(pinCode, userProvider);
  }

  verifyUser(String code, UserProvider userProvider) async {
    try {
      setState(() => _loading = true);
      var reply = await GrpcClient.instance.client.verifyUserAccount(
        VerifyUserAccountRequest(
          email: userProvider.user.email,
          code: code,
        ),
      );

      await userProvider.setUserAsVerified();
      setState(() => _loading = false);

      if (context.mounted) {
        Navigator.of(context).pop(); // remove current page
        Navigator.pushNamed(context, loginRoute);
      }
    } catch (err) {
      setState(() => _loading = false);
      if (err.runtimeType != GrpcError) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).verifyUserError));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
            _scaffoldKey, (err as GrpcError).message ?? LanguageService.translation(context).verifyUserError));
      }
    }
  }

  openResendVerifyUserPage() {
    Navigator.pop(context);
    Navigator.pushNamed(context, resendVerifyUserRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(LanguageService.translation(context).verifyAccount),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 76),
                        child: Text(
                          LanguageService.translation(context).reasonVerifyAccount,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Consumer<UserProvider>(
                        builder: (context, userProvider, child) => Pinput(
                          length: pinCodeLength,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(pinCodeLength)
                          ],
                          onChanged: (value) => setState(() => pinCode = value),
                          onCompleted: (value) => verifyUser(value, userProvider),
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
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Column(children: [
                      SizedBox(
                        width: double.infinity,
                        child: Consumer<UserProvider>(
                          builder: (context, userProvider, child) => ElevatedButton(
                            onPressed: () => onManualVerifyUser(userProvider),
                            child: Text(LanguageService.translation(context).verify),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: openResendVerifyUserPage,
                          child: Text(LanguageService.translation(context).resendVerificationCode),
                        ),
                      )
                    ]),
                  ),
                ]),
              ),
            ),
    );
  }
}
