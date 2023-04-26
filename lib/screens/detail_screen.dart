import 'package:flutter/material.dart';

import 'package:kampung_snack/features/participant/domain/entities/participant.dart';
import 'package:kampung_snack/widgets/detail_web_page.dart';
import '../widgets/detail_mobile_page.dart';

class DetailScreen extends StatelessWidget {
  static const String routeName = '/detail';

  const DetailScreen({super.key, required this.participant});

  final Participant participant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return DetailMobilePage(participant: participant);
            } else {
              return DetailWebPage(participant: participant);
            }
          },
        ),
      ),
    );
  }
}
