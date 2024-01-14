import 'dart:io';

import 'package:flutter/material.dart';
import 'package:golden_soft_test/core/app_manager/color_manager/color_manager.dart';
import 'package:golden_soft_test/core/app_manager/service_locator/injection.dart';
import 'package:golden_soft_test/core/constant/assets.dart';
import 'package:golden_soft_test/core/extention/context_extension.dart';
import 'package:golden_soft_test/features/register_technician/presentation/bloc/tec_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageAvatar extends StatefulWidget {
  const ImageAvatar({Key? key, required this.pickFile}) : super(key: key);
  final Function(File) pickFile;


  @override
  _ImageAvatarState createState() => _ImageAvatarState();
}

class _ImageAvatarState extends State<ImageAvatar> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      getIt<TecBloc>().avatarPhoto=_imageFile??File('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height(0.01)),
      child: Center(
        child: InkWell(
          onTap: _pickImage,
          child: CircleAvatar(
            radius: context.width(0.12), // Adjust the radius as needed
            backgroundColor: ColorManager.darkGrey,
            backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(Assets.camera, width: context.width(0.065)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
