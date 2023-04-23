import 'package:flutter/widgets.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Login',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 34,
      ),
    );
  }
}
