import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/language_service.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(LanguageService.translation(context).pageNotFound)),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  LanguageService.translation(context).pageNotFoundMessage,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      homeRoute,
                      (route) => false,
                    );
                  },
                  child: Text(LanguageService.translation(context).goHome),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
