import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampung_snack/features/auth/cubit/logout_cubit.dart';
import 'package:kampung_snack/features/participant/cubit/participant_web_cubit.dart';
import 'package:kampung_snack/screens/form_screen.dart';
import 'package:kampung_snack/screens/login_screen.dart';
import 'package:kampung_snack/sl.dart';
import 'package:kampung_snack/theme_manager/color_manager.dart';
import 'package:kampung_snack/theme_manager/navigation_manager.dart';
import 'package:kampung_snack/widgets/custom_button.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../widgets/home_mobile_page.dart';

class HomeScreen extends StatefulWidget {
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
            context.toLoginScreen(const LoginScreen());
          }
        },
        child: kIsWeb
            ? Scaffold(
                appBar: AppBar(
                  title: const Text('Donor Kuy'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        _logoutCubit.startLogout();
                      },
                      icon: const Icon(Icons.exit_to_app),
                    )
                  ],
                ),
                body: Column(
                  children: [
                    Expanded(
                      child:
                          BlocBuilder<ParticipantWebCubit, ParticipantWebState>(
                        builder: (context, participantWebState) {
                          final participants = participantWebState.participants;

                          return Text('${participants.length}');
                        },
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        border:
                            Border(top: BorderSide(color: ColorManager.grey)),
                      ),
                      alignment: Alignment.centerRight,
                      child: CustomButton(
                        text: 'Tambah peserta',
                        onTap: () => context.toScreen(const FormScreen()),
                      ),
                    )
                  ],
                ),
              )
            : HomeMobilePage(logoutCubit: _logoutCubit),
      ),
    );
  }
}
