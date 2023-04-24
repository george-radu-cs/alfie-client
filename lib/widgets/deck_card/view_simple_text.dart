import 'package:flutter/material.dart';

class ViewSimpleText extends StatelessWidget {
  final String text;

  const ViewSimpleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}
