import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampung_snack/features/participant/cubit/form_participant_cubit.dart';
import 'package:kampung_snack/features/participant/cubit/participant_cubit.dart';
import 'package:kampung_snack/sl.dart';
import 'package:kampung_snack/theme_manager/navigation_manager.dart';

import 'package:kampung_snack/theme_manager/space_manager.dart';
import 'package:kampung_snack/utils/image_pick_service.dart';
import 'package:kampung_snack/widgets/custom_button.dart';
import 'package:kampung_snack/widgets/custom_text_form.dart';

import '../widgets/photo_participant.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _jobController;
  late ImagePickService _imagePickService;
  late FormParticipantCubit _formParticipantCubit;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _jobController = TextEditingController();
    _imagePickService = sl<ImagePickService>();
    _formParticipantCubit = sl<FormParticipantCubit>();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _jobController.dispose();
    _formParticipantCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _formParticipantCubit,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
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

                      final participant =
                          _formParticipantCubit.state.participant;

                      context
                          .read<ParticipantCubit>()
                          .addParticipant(participant);

                      context.toBackScreen();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
