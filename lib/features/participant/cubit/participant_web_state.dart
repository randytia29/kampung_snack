// ignore_for_file: prefer_const_constructors

part of 'participant_web_cubit.dart';

class ParticipantWebState {
  const ParticipantWebState({required this.participants});

  final List<Participant> participants;

  factory ParticipantWebState.initial() {
    return ParticipantWebState(participants: []);
  }

  ParticipantWebState copyWith({required List<Participant> participants}) {
    return ParticipantWebState(participants: participants);
  }
}
