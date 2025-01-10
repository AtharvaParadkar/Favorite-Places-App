import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

void _takePicture(){}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryFixedVariant.withAlpha(128),
          width: 3,
        ),
      ),
      child: TextButton.icon(
        onPressed: _takePicture,
        label: const Text(
          'Take Picture',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.camera,
          color: Colors.white,
        ),
      ),
    );
  }
}
