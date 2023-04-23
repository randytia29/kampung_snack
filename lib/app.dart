import 'package:flutter/material.dart';
import 'package:kampung_snack/screens/home_screen.dart';
import 'package:kampung_snack/screens/login_screen.dart';
import 'package:kampung_snack/sl.dart';
import 'package:kampung_snack/utils/shared_pref.dart';

import 'theme_manager/theme_data_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final token = sl<SharedPref>().getAccessToken();

    return MaterialApp(
      theme: getApplicationThemeData(),
      home: token == null ? const LoginScreen() : const HomeScreen(),
    );
  }
}
