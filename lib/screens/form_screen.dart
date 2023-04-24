import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kampung_snack/sl.dart';
import 'package:kampung_snack/theme_manager/asset_manager.dart';
import 'package:kampung_snack/theme_manager/color_manager.dart';
import 'package:kampung_snack/theme_manager/space_manager.dart';
import 'package:kampung_snack/utils/image_pick_service.dart';
import 'package:kampung_snack/widgets/custom_button.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late ImagePickService _imagePickService;
  Uint8List? selectedFile;

  @override
  void initState() {
    super.initState();
    _imagePickService = sl<ImagePickService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.grey),
                  ),
                  child: selectedFile == null
                      ? Image.asset(
                          AssetManager.noImage,
                          fit: BoxFit.cover,
                        )
                      : Image.memory(
                          selectedFile!,
                          fit: BoxFit.cover,
                        ),
                ),
                Positioned(
                  bottom: -24,
                  child: CircleAvatar(
                    backgroundColor: ColorManager.grey,
                    child: IconButton(
                      onPressed: () async {
                        final byteFile = await _imagePickService
                            .pickMobileImage(ImageSource.camera);

                        if (byteFile == null) {
                          return;
                        }

                        setState(() {
                          selectedFile = byteFile;
                        });
                      },
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ),
                ),
              ],
            ),
            40.0.spaceY,
            CustomButton(
              text: 'pick image',
              onTap: () async {
                // final imagePick = sl<ImagePickService>();

                // final file = await imagePick.pickImage(ImageSource.gallery);

                // if (file == null) {
                //   return;
                // }

                // setState(() {
                //   selectedFile = file;
                // });

                // log(file.path);
              },
            )
          ],
        ),
      ),
    );
  }
}
