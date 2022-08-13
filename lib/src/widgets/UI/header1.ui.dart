import 'package:flutter/material.dart';
import 'package:startyo/theme/text.theme.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(
      {Key? key, this.color, this.size, required this.text, this.header2})
      : super(key: key);
  final Color? color;
  final double? size;
  final String text;
  final bool? header2;
  @override
  Widget build(BuildContext context) {
    var fontStyle = size != null
        ? TextThemes.typography.headline1?.copyWith(fontSize: size)
        : TextThemes.typography.headline1;
    ;
    if (header2 != null) {
      if (header2!) {
        fontStyle = size != null
            ? TextThemes.typography.headline2?.copyWith(fontSize: size)
            : TextThemes.typography.headline2;
      } else {
        fontStyle = size != null
            ? TextThemes.typography.headline1?.copyWith(fontSize: size)
            : TextThemes.typography.headline1;
      }
    }
    return Text(
      text,
      style: fontStyle,
      textAlign: TextAlign.center,
    );
  }
}
