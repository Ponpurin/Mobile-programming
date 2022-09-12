import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key, required this.callback}) : super(key: key);
  final void Function({required File pickedImageFile}) callback;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;
  ImageProvider? _image;

  void pickImage() async {
    final pickImageXFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (kIsWeb) {
      _pickedImageFile =
          await DefaultCacheManager().getSingleFile(pickImageXFile!.path);
    } else {
      _pickedImageFile = File(pickImageXFile!.path);
    }
    setState(() {
      _image = FileImage(_pickedImageFile!);
    });
    widget.callback(pickedImageFile: _pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(
        radius: 40,
        backgroundImage: _image,
      ),
      TextButton.icon(
          onPressed: () => pickImage(),
          icon: const Icon(Icons.image),
          label: const Text('Select Image'))
    ]);
  }
}
