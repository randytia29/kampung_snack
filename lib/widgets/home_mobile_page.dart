import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampung_snack/theme_manager/navigation_manager.dart';

import '../features/auth/cubit/logout_cubit.dart';
import '../features/participant/cubit/participant_cubit.dart';
import '../screens/form_screen.dart';
import '../theme_manager/color_manager.dart';
import 'custom_button.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({
    super.key,
    required LogoutCubit logoutCubit,
  }) : _logoutCubit = logoutCubit;

  final LogoutCubit _logoutCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: BlocBuilder<ParticipantCubit, ParticipantState>(
              builder: (context, participantState) {
                final participants = participantState.participants;

                return Text('${participants.length}');
              },
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorManager.white,
              border: Border(top: BorderSide(color: ColorManager.grey)),
            ),
            alignment: Alignment.centerRight,
            child: CustomButton(
              text: 'Tambah peserta',
              onTap: () => context.toScreen(const FormScreen()),
            ),
          )
        ],
      ),
    );
  }
}
