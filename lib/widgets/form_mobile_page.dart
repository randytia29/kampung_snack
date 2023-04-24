import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampung_snack/theme_manager/navigation_manager.dart';
import 'package:kampung_snack/theme_manager/space_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../features/participant/cubit/form_participant_cubit.dart';
import '../features/participant/cubit/participant_cubit.dart';
import '../features/participant/cubit/participant_web_cubit.dart';
import '../utils/image_pick_service.dart';
import 'custom_button.dart';
import 'custom_text_form.dart';
import 'photo_participant.dart';

class FormMobilePage extends StatelessWidget {
  const FormMobilePage({
    super.key,
    required ImagePickService imagePickService,
    required FormParticipantCubit formParticipantCubit,
    required TextEditingController nameController,
    required TextEditingController addressController,
    required TextEditingController jobController,
    required GlobalKey<FormState> formKey,
  })  : _imagePickService = imagePickService,
        _formParticipantCubit = formParticipantCubit,
        _nameController = nameController,
        _addressController = addressController,
        _jobController = jobController,
        _formKey = formKey;

  final ImagePickService _imagePickService;
  final FormParticipantCubit _formParticipantCubit;
  final TextEditingController _nameController;
  final TextEditingController _addressController;
  final TextEditingController _jobController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        80.0.spaceY,
        PhotoParticipant(
          imagePickService: _imagePickService,
          formParticipantCubit: _formParticipantCubit,
        ),
        40.0.spaceY,
        CustomTextForm(
          controller: _nameController,
          title: 'Nama',
          textInputAction: TextInputAction.next,
          validate: (value) {
            if ((value ?? '').isEmpty) {
              return 'Isi nama';
            } else {
              return null;
            }
          },
        ),
        24.0.spaceY,
        CustomTextForm(
          controller: _addressController,
          title: 'Alamat',
          textInputAction: TextInputAction.next,
          validate: (value) {
            if ((value ?? '').isEmpty) {
              return 'Isi alamat';
            } else {
              return null;
            }
          },
        ),
        24.0.spaceY,
        CustomTextForm(
          controller: _jobController,
          title: 'Pekerjaan',
          textInputAction: TextInputAction.next,
          validate: (value) {
            if ((value ?? '').isEmpty) {
              return 'Isi pekerjaan';
            } else {
              return null;
            }
          },
        ),
        32.0.spaceY,
        CustomButton(
          text: 'Simpan',
          onTap: () async {
            if ((_formKey.currentState ?? FormState()).validate()) {
              _formParticipantCubit.editData(_nameController.text,
                  _addressController.text, _jobController.text);

              final participant = _formParticipantCubit.state.participant;

              if (kIsWeb) {
                context.read<ParticipantWebCubit>().addParticipant(participant);
              } else {
                context.read<ParticipantCubit>().addParticipant(participant);
              }

              context.toBackScreen();
            }
          },
        )
      ],
    );
  }
}
