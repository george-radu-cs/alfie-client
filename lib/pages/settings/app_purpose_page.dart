import 'package:alfie/services/language_service.dart';
import 'package:flutter/material.dart';

class AppPurposePage extends StatelessWidget {
  const AppPurposePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageService.translation(context).whatIsThisApp),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(LanguageService.translation(context).appPurposeMessage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
