import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampung_snack/features/auth/cubit/login_cubit.dart';
import 'package:kampung_snack/screens/home_screen.dart';
import 'package:kampung_snack/sl.dart';
import 'package:kampung_snack/theme_manager/navigation_manager.dart';

import '../widgets/login_mobile_page.dart';
import '../widgets/login_web_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  late LoginCubit _loginCubit;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    _loginCubit = sl<LoginCubit>();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    _loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => _loginCubit,
        child: BlocListener<LoginCubit, LoginState>(
          listener: (BuildContext context, loginState) {
            if (loginState is LoginSuccess) {
              context.toJumpPage(const HomeScreen());
            }
          },
          child: Form(
            key: _formKey,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth <= 600) {
                  return LoginMobilePage(
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                    formKey: _formKey,
                    loginCubit: _loginCubit,
                  );
                } else {
                  return LoginWebPage(
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                    formKey: _formKey,
                    loginCubit: _loginCubit,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
