import 'package:bloc/bloc.dart';

import '../domain/entities/participant.dart';

part 'participant_web_state.dart';

class ParticipantWebCubit extends Cubit<ParticipantWebState> {
  ParticipantWebCubit() : super(ParticipantWebState.initial());

  void addParticipant(Participant participant) {
    var participants = state.participants;

    participants.add(participant);

    emit(state.copyWith(participants: participants));
  }
}
