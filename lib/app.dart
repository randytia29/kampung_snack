import 'package:flutter/material.dart';
import 'package:kampung_snack/screens/login_screen.dart';

import 'theme_manager/theme_data_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationThemeData(),
      home: const LoginScreen(),
    );
  }
}
