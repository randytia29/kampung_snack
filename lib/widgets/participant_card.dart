import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:kampung_snack/theme_manager/space_manager.dart';

import '../features/participant/domain/entities/participant.dart';
import '../theme_manager/asset_manager.dart';

class ParticipantCard extends StatelessWidget {
  const ParticipantCard({
    super.key,
    required this.participant,
  });

  final Participant participant;

  @override
  Widget build(BuildContext context) {
    final image = participant.imgByte;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 200,
            child: image == null
                ? Image.asset(
                    AssetManager.noImage,
                    fit: BoxFit.cover,
                  )
                : Image.memory(
                    Uint8List.fromList(image.codeUnits),
                    fit: BoxFit.cover,
                  ),
          ),
          8.0.spaceY,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              participant.name ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
