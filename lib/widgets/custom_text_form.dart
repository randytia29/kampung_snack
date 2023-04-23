import 'package:flutter/material.dart';
import 'package:kampung_snack/theme_manager/color_manager.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    required this.controller,
    this.validate,
    this.obscureText = false,
    this.textInputAction,
    required this.title,
    this.suffix,
    this.textInputType,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validate;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final String title;
  final Widget? suffix;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: textInputType,
          style: const TextStyle(fontSize: 16),
          textInputAction: textInputAction,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            fillColor: ColorManager.white,
            filled: true,
            suffixIcon: suffix,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.grey),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          validator: validate,
        ),
      ],
    );
  }
}
