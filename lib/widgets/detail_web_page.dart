import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:kampung_snack/theme_manager/space_manager.dart';

import '../features/participant/domain/entities/participant.dart';
import '../theme_manager/asset_manager.dart';

class DetailWebPage extends StatelessWidget {
  const DetailWebPage({super.key, required this.participant});

  final Participant participant;

  @override
  Widget build(BuildContext context) {
    final image = participant.imgByte;

    return Column(
      children: [
        80.0.spaceY,
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 600,
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    margin: const EdgeInsets.all(16),
                    child: image == null
                        ? Image.asset(
                            AssetManager.noImage,
                            fit: BoxFit.cover,
                          )
                        : kIsWeb
                            ? Image.network(
                                image,
                                fit: BoxFit.cover,
                              )
                            : Image.memory(
                                Uint8List.fromList(image.codeUnits),
                                fit: BoxFit.cover,
                              ),
                  ),
                  8.0.spaceX,
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(participant.name ?? '-'),
                        8.0.spaceY,
                        Text(participant.address ?? '-'),
                        8.0.spaceY,
                        Text(participant.job ?? '-')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
