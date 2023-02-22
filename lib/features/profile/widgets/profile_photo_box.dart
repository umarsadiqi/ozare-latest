import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ozare/common/dialogs/dialogs.dart';
import 'package:ozare/features/profile/bloc/profile_bloc.dart';

class ProfilePhotoBox extends StatelessWidget {
  const ProfilePhotoBox({
    super.key,
    required this.page,
    required this.imageUrl,
  });

  final PPage page;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 110,
          width: 110,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(
                  imageUrl!), // const AssetImage('assets/images/default.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (page == PPage.editAccount && !kIsWeb)
          Positioned(
            bottom: 2,
            right: 24,
            child: GestureDetector(
              onTap: () {
                // create a dialog to select image from gallery and upload it
                showDialog(
                  context: context,
                  builder: (_) => BlocProvider<ProfileBloc>.value(
                    value: context.read<ProfileBloc>(),
                    child: ProfilePhotoDialog(
                      imageUrl: imageUrl!,
                    ),
                  ),
                );
              },
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ]),
                child: Icon(
                  Icons.photo_camera_outlined,
                  size: 22,
                  color: Colors.grey[800]!,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class ProfilePhotoDialog extends StatefulWidget {
  const ProfilePhotoDialog({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  State<ProfilePhotoDialog> createState() => _ProfilePhotoDialogState();
}

class _ProfilePhotoDialogState extends State<ProfilePhotoDialog> {
  final _imagePicker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Change Profile Photo',
              style: TextStyle(
                fontSize: 16,
              )),
          const SizedBox(height: 16),
          Stack(
            children: [
              Container(
                height: 110,
                width: 110,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  color: Colors.white,
                  image: DecorationImage(
                    image: _imageFile != null
                        ? FileImage(File(_imageFile!.path))
                        : NetworkImage(widget.imageUrl) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 24,
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ]),
                    child: Icon(
                      Icons.photo_camera_outlined,
                      size: 18,
                      color: Colors.grey[800]!,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_imageFile != null) {
                context
                    .read<ProfileBloc>()
                    .add(ProfilePhotoUploadRequested(_imageFile!));
                Navigator.of(context).pop();
              } else {
                showSnackBar(context, 'Please select an image');
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
