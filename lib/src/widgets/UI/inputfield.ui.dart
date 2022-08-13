import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:startyo/src/widgets/UI/body1.ui.dart';
import 'package:startyo/theme/colors.theme.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPassword,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Body1(text: label),
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 46,
          child: TextFormField(
            obscureText: isPassword ?? false,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              filled: true,
              fillColor: Palette.primary.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.sp),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.only(
                left: 20,
                top: 20,
                bottom: 20,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a value";
              }
            },
            cursorColor: Palette.primary,
            onSaved: (value) => controller.text = value!,
          ),
        ),
      ],
    );
  }
}
