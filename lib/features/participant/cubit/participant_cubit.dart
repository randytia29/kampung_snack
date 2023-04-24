import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kampung_snack/features/participant/domain/entities/participant.dart';

part 'participant_state.dart';

class ParticipantCubit extends Cubit<ParticipantState> with HydratedMixin {
  ParticipantCubit() : super(ParticipantState.initial());

  void addParticipant(Participant participant) {
    var participants = state.participants;

    participants.add(participant);

    emit(state.copyWith(participants: participants));
  }

  @override
  ParticipantState? fromJson(Map<String, dynamic> json) {
    return ParticipantState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ParticipantState state) {
    return state.toMap();
  }
}
