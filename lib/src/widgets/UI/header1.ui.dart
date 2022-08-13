import 'package:flutter/material.dart';
import 'package:startyo/theme/text.theme.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key, this.color, this.size, required this.text})
      : super(key: key);
  final Color? color;
  final double? size;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextThemes.typography.headline1);
  }
}
