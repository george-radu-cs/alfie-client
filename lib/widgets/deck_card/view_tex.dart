import "package:alfie/services/language_service.dart";
import "package:flutter/material.dart";
import "package:flutter_tex/flutter_tex.dart";
import 'package:flutter/services.dart';

class ViewTex extends StatelessWidget {
  final String texId;
  final String text;

  const ViewTex({Key? key, required this.texId, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TeXView(
      child: TeXViewInkWell(
          id: texId,
          child: TeXViewDocument(text),
          onTap: (id) async {
            await Clipboard.setData(ClipboardData(text: text));
          }),
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
