import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../features/participant/cubit/form_participant_cubit.dart';
import '../theme_manager/asset_manager.dart';
import '../theme_manager/color_manager.dart';
import '../utils/image_pick_service.dart';

class PhotoParticipant extends StatelessWidget {
  const PhotoParticipant({
    super.key,
    required ImagePickService imagePickService,
    required FormParticipantCubit formParticipantCubit,
  })  : _imagePickService = imagePickService,
        _formParticipantCubit = formParticipantCubit;

  final ImagePickService _imagePickService;
  final FormParticipantCubit _formParticipantCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        BlocBuilder<FormParticipantCubit, FormParticipantState>(
          builder: (context, formParticipantState) {
            final image = formParticipantState.participant.imgByte;

            return Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.grey),
              ),
              child: image == null
                  ? Image.asset(
                      AssetManager.noImage,
                      fit: BoxFit.cover,
                    )
                  : Image.memory(
                      Uint8List.fromList(image.codeUnits),
                      fit: BoxFit.cover,
                    ),
            );
          },
        ),
        Positioned(
          bottom: -24,
          child: CircleAvatar(
            backgroundColor: ColorManager.grey,
            child: IconButton(
              onPressed: () async {
                final byteFile =
                    await _imagePickService.pickMobileImage(ImageSource.camera);

                if (byteFile == null) {
                  return;
                }

                final imgString = String.fromCharCodes(byteFile);

                _formParticipantCubit.editImage(imgString);
              },
              icon: const Icon(Icons.camera_alt),
            ),
          ),
        ),
      ],
    );
  }
}
