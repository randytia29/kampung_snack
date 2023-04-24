import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ImagePickService {
  final ImagePicker picker;

  ImagePickService({required this.picker});

  Future<File?> _pickImage(ImageSource source) async {
    final xFile = await picker.pickImage(source: source);

    if (xFile == null) {
      return null;
    }

    final file = File(xFile.path);

    return file;
  }

  Future<Uint8List?> pickMobileImage(ImageSource source) async {
    final file = await _pickImage(source);

    if (file == null) {
      return null;
    }

    final byteFile = await file.readAsBytes();

    return byteFile;
  }

  Future<File?> pickVideo(ImageSource source) async {
    final xFile = await picker.pickVideo(source: source);

    if (xFile == null) {
      return null;
    }

    final file = File(xFile.path);

    return file;
  }
}
