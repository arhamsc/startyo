import 'package:flutter/material.dart';
import 'package:startyo/theme/text.theme.dart';

class Body1 extends StatelessWidget {
  const Body1({Key? key, this.color, this.size, required this.text})
      : super(key: key);
  final Color? color;
  final double? size;
  final String text;
  @override
  Widget build(BuildContext context) {
    final textStyle = color != null
        ? TextThemes.typography.bodyText1?.copyWith(color: color)
        : TextThemes.typography.bodyText1;
    return Text(
      text,
      style: textStyle,
      textScaleFactor: 1.0,
    );
  }
}
