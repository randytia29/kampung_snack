import 'package:flutter/material.dart';
import 'package:kampung_snack/theme_manager/color_manager.dart';
import 'package:kampung_snack/theme_manager/space_manager.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    required this.controller,
    this.validate,
    this.obscureText = false,
    this.textInputAction,
    required this.title,
    this.textInputType,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validate;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final String title;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          8.0.spaceY,
          TextFormField(
            keyboardType: textInputType,
            style: const TextStyle(fontSize: 16),
            textInputAction: textInputAction,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Isi apa saja',
              hintStyle: TextStyle(color: ColorManager.grey, fontSize: 16),
              fillColor: ColorManager.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.grey),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
            validator: validate,
          ),
        ],
      ),
    );
  }
}
