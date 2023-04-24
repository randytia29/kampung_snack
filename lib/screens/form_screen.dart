import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampung_snack/features/participant/cubit/form_participant_cubit.dart';
import 'package:kampung_snack/sl.dart';

import 'package:kampung_snack/utils/image_pick_service.dart';

import '../widgets/form_mobile_page.dart';
import '../widgets/form_web_page.dart';

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
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth <= 600) {
                  return FormMobilePage(
                    imagePickService: _imagePickService,
                    formParticipantCubit: _formParticipantCubit,
                    nameController: _nameController,
                    addressController: _addressController,
                    jobController: _jobController,
                    formKey: _formKey,
                  );
                } else {
                  return FormWebPage(
                    imagePickService: _imagePickService,
                    formParticipantCubit: _formParticipantCubit,
                    nameController: _nameController,
                    addressController: _addressController,
                    jobController: _jobController,
                    formKey: _formKey,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
