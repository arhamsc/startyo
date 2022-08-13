import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BigButton extends StatelessWidget {
  const BigButton(
      {Key? key, required this.buttonFunc, required this.text, this.isOutlined})
      : super(key: key);
  final Function buttonFunc;
  final String text;
  final bool? isOutlined;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76.w,
      height: 5.h,
      child: isOutlined != null && isOutlined!
          ? OutlinedButton(
              onPressed: () => buttonFunc(),
              child: Text(text),
            )
          : ElevatedButton(
              onPressed: () => buttonFunc(),
              child: Text(text),
            ),
    );
  }
}
