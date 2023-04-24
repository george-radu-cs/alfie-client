import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ViewHtml extends StatelessWidget {
  final String text;

  const ViewHtml({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Html(data: text),
    );
  }
}
