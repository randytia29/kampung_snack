import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampung_snack/features/participant/domain/entities/participant.dart';

part 'form_participant_state.dart';

class FormParticipantCubit extends Cubit<FormParticipantState> {
  FormParticipantCubit() : super(FormParticipantState.initial());

  void editImage(String image) {
    var participant = state.participant;

    var edittedParticipant = participant.copyWith(imgByte: image);

    emit(state.copyWith(participant: edittedParticipant));
  }

  void editData(String name, String address, String job) {
    var participant = state.participant;

    var edittedParticipant =
        participant.copyWith(name: name, address: address, job: job);

    emit(state.copyWith(participant: edittedParticipant));
  }
}
