import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(backgroundColor: Theme.of(context).primaryColorLight,
        title: const Text('Choose Image Source'),
        actions: [
          Container(
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Theme.of(context)
                    .colorScheme
                    .inverseSurface
                    .withAlpha(128),
              ),
            ),
            child: TextButton.icon(
              onPressed: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
              label:
                  const Text('Camera', style: TextStyle(color: Colors.black)),
              icon: const Icon(Icons.camera_alt, color: Colors.black),
            ),
          ),
          Container(
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Theme.of(context)
                    .colorScheme
                    .inverseSurface
                    .withAlpha(128),
              ),
            ),
            child: TextButton.icon(
              onPressed: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              label:
                  const Text('Gallery', style: TextStyle(color: Colors.black)),
              icon: const Icon(Icons.filter, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  void _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: source,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });

    widget.onPickImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      label: const Text('Take Picture', style: TextStyle(color: Colors.white)),
      icon: const Icon(Icons.camera, color: Colors.white),
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context)
              .colorScheme
              .onPrimaryFixedVariant
              .withAlpha(128),
        ),
      ),
      child: content,
    );
  }
}
