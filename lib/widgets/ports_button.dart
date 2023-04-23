import 'package:flutter/material.dart';

class PortsButton extends StatelessWidget {
  const PortsButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.size,
    this.fontSize,
  }) : super(key: key);

  final String text;
  final void Function()? onTap;
  final Size? size;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
