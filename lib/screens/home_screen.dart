import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampung_snack/features/auth/cubit/logout_cubit.dart';
import 'package:kampung_snack/screens/login_screen.dart';
import 'package:kampung_snack/sl.dart';
import 'package:kampung_snack/theme_manager/navigation_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../widgets/home_mobile_page.dart';
import '../widgets/home_web_page.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late LogoutCubit _logoutCubit;

  @override
  void initState() {
    super.initState();
    _logoutCubit = sl<LogoutCubit>();
  }

  @override
  void dispose() {
    _logoutCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _logoutCubit,
      child: BlocListener<LogoutCubit, LogoutState>(
        listener: (context, logoutState) {
          if (logoutState is LogoutSuccess) {
            context.toLoginScreen(LoginScreen.routeName);
          }
        },
        child: kIsWeb
            ? HomeWebPage(logoutCubit: _logoutCubit)
            : HomeMobilePage(logoutCubit: _logoutCubit),
      ),
    );
  }
}
