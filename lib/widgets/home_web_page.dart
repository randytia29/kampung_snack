import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampung_snack/theme_manager/navigation_manager.dart';

import '../features/auth/cubit/logout_cubit.dart';
import '../features/participant/cubit/participant_web_cubit.dart';
import '../screens/form_screen.dart';
import '../theme_manager/color_manager.dart';
import 'custom_button.dart';
import 'participant_card.dart';

class HomeWebPage extends StatelessWidget {
  const HomeWebPage({
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
            child: BlocBuilder<ParticipantWebCubit, ParticipantWebState>(
              builder: (context, participantWebState) {
                final participants = participantWebState.participants;

                if (participants.isEmpty) {
                  return const Center(
                    child: Text('Belum ada peserta'),
                  );
                } else {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth <= 850) {
                        return GridView.count(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.85,
                          crossAxisCount: 3,
                          children: participants
                              .map(
                                (participant) => ParticipantCard(
                                  participant: participant,
                                  heightImage: 125,
                                ),
                              )
                              .toList(),
                        );
                      } else if (constraints.maxWidth <= 1100) {
                        return GridView.count(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          crossAxisCount: 4,
                          children: participants
                              .map(
                                (participant) => ParticipantCard(
                                  participant: participant,
                                  heightImage: 145,
                                ),
                              )
                              .toList(),
                        );
                      } else if (constraints.maxWidth <= 1300) {
                        return GridView.count(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          crossAxisCount: 5,
                          children: participants
                              .map(
                                (participant) => ParticipantCard(
                                  participant: participant,
                                  heightImage: 145,
                                ),
                              )
                              .toList(),
                        );
                      } else {
                        return GridView.count(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.75,
                          crossAxisCount: 7,
                          children: participants
                              .map(
                                (participant) => ParticipantCard(
                                  participant: participant,
                                  heightImage: 175,
                                ),
                              )
                              .toList(),
                        );
                      }
                    },
                  );
                }
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
              onTap: () => context.toScreen(FormScreen.routeName),
            ),
          )
        ],
      ),
    );
  }
}
