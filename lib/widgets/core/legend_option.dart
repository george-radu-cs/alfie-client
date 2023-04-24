import 'package:flutter/material.dart';

class LegendOption extends StatelessWidget {
  final String text;
  final Color color;

  const LegendOption({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
          ),
        ),
        const SizedBox(width: 5),
        Text(text)
      ],
    );
  }
}
