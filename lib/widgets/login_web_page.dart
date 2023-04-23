import 'package:flutter/material.dart';
import 'package:kampung_snack/theme_manager/color_manager.dart';
import 'package:kampung_snack/theme_manager/space_manager.dart';

import '../features/auth/cubit/login_cubit.dart';
import 'custom_button.dart';
import 'custom_text_form.dart';
import 'login_title.dart';

class LoginWebPage extends StatelessWidget {
  const LoginWebPage({
    super.key,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required GlobalKey<FormState> formKey,
    required LoginCubit loginCubit,
  })  : _usernameController = usernameController,
        _passwordController = passwordController,
        _formKey = formKey,
        _loginCubit = loginCubit;

  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey;
  final LoginCubit _loginCubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 450,
        height: 450,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.grey),
          color: ColorManager.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginTitle(),
            32.0.spaceY,
            CustomTextForm(
              controller: _usernameController,
              textInputAction: TextInputAction.next,
              validate: (value) {
                if ((value ?? '').isEmpty) {
                  return 'Isi username';
                } else {
                  return null;
                }
              },
              title: 'Username',
            ),
            24.0.spaceY,
            CustomTextForm(
              controller: _passwordController,
              obscureText: true,
              validate: (value) {
                if ((value ?? '').isEmpty) {
                  return 'Isi password';
                } else {
                  return null;
                }
              },
              title: 'Password',
            ),
            24.0.spaceY,
            CustomButton(
              text: 'Login',
              onTap: () {
                if ((_formKey.currentState ?? FormState()).validate()) {
                  _loginCubit.startLogin(
                      _usernameController.text, _passwordController.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
