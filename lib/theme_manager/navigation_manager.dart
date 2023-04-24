import 'package:flutter/material.dart';

extension Navigate on BuildContext {
  void toScreen(Widget screen) => Navigator.of(this).push(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );

  void toJumpScreen(Widget screen) => Navigator.of(this).pushReplacement(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );

  void toLoginScreen(Widget screen) => Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        (route) => false,
      );

  void toBackScreen() => Navigator.of(this).pop();
}
