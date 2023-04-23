import 'package:flutter/material.dart';

import '../widgets/custom_text_form.dart';
import '../widgets/login_title.dart';
import '../widgets/ports_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const LoginTitle(),
            const SizedBox(
              height: 30,
            ),
            CustomTextForm(
              controller: usernameController,
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
            const SizedBox(
              height: 20,
            ),
            CustomTextForm(
              controller: passwordController,
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
            const SizedBox(
              height: 30,
            ),
            PortsButton(
              text: 'LOGIN',
              onTap: () {
                if ((_formKey.currentState ?? FormState()).validate()) {}
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
