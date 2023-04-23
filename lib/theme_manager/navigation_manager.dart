import 'package:flutter/material.dart';

class NavigateManager {
  static PageRouteBuilder<dynamic> _routeTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeIn));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

extension Navigate on BuildContext {
  void toPage(Widget page) => Navigator.of(this).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  void toPageSlide(Widget page) =>
      Navigator.of(this).push(NavigateManager._routeTransition(page));

  void toJumpPage(Widget page) => Navigator.of(this).pushReplacement(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
}
