// ignore_for_file: prefer_const_constructors

part of 'participant_cubit.dart';

class ParticipantState {
  const ParticipantState({required this.participants});

  final List<Participant> participants;

  factory ParticipantState.initial() {
    return ParticipantState(participants: []);
  }

  ParticipantState copyWith({required List<Participant> participants}) {
    return ParticipantState(participants: participants);
  }

  Map<String, dynamic>? toMap() {
    final participantsToJson = participants.map((e) => e.toJson()).toList();

    if (participantsToJson.isNotEmpty) {
      return {'data': participantsToJson};
    } else {
      return {'data': null};
    }
  }

  factory ParticipantState.fromMap(Map<String, dynamic> json) {
    final response = json['data'];

    final data = List.from(response);

    final participants = data.map((e) => Participant.fromJson(e)).toList();

    return ParticipantState(participants: participants);
  }
}
