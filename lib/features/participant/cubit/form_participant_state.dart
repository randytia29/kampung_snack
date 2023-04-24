part of 'form_participant_cubit.dart';

class FormParticipantState extends Equatable {
  const FormParticipantState({required this.participant});

  final Participant participant;

  factory FormParticipantState.initial() {
    return FormParticipantState(participant: Participant());
  }

  FormParticipantState copyWith({required Participant participant}) {
    return FormParticipantState(participant: participant);
  }

  @override
  List<Object> get props => [participant];
}
