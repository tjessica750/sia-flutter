import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_driven_app/screens/photo_page.dart';

class PhotoPanelControlPage extends StatefulWidget {
  final PhotoPart photoPart;

  const PhotoPanelControlPage({super.key, required this.photoPart});

  @override
  // ignore: library_private_types_in_public_api
  _PhotoPanelControlPageState createState() => _PhotoPanelControlPageState();
}

class _PhotoPanelControlPageState extends State<PhotoPanelControlPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void takePictureFromFrontCamera(BuildContext context) async {
    final picker = ImagePicker();

    var image = await picker.pickImage(
        maxHeight: 800,
        maxWidth: 800,
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front);

    if (image == null) {
      return;
    }

    widget.photoPart.photo = File(image.path);

    // ignore: use_build_context_synchronously
    Navigator.pop(context, widget.photoPart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tomar fotografia")),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            takePictureFromFrontCamera(context);
          },
          child: const SizedBox(
            child: Icon(Icons.add_a_photo),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                  child: widget.photoPart.photo == null
                      ? const Text('No se ha seleccionado una imagen.')
                      : Image.file(
                          widget.photoPart.photo!,
                          fit: BoxFit.cover,
                        )),
            ],
          ),
        ));
  }
}
