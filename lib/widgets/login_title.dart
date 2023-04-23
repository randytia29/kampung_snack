import 'package:flutter/widgets.dart';
import 'package:kampung_snack/theme_manager/color_manager.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ports Asset\nManagement System'.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 23,
            color: ColorManager.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
