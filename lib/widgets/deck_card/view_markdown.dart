import 'package:alfie/services/language_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class ViewMarkdown extends StatelessWidget {
  final String text;

  const ViewMarkdown({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TeXView(
      child: TeXViewMarkdown(text),
      style: TeXViewStyle(
        backgroundColor: Theme.of(context).textTheme.titleSmall!.backgroundColor,
        contentColor: Theme.of(context).textTheme.titleSmall!.color,
      ),
      loadingWidgetBuilder: (context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(LanguageService.translation(context).rendering),
            )
          ],
        ),
      ),
    );
  }
}
