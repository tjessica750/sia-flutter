import 'dart:io';
import 'package:flutter/material.dart';
import 'package:test_driven_app/components/main_drawer.dart';
import 'package:test_driven_app/screens/photo_panel_control_page.dart';

class PhotoPart {
  final String name;
  File? photo;

  PhotoPart({required this.name, this.photo});
}

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  final List<PhotoPart> photoParts = [
    PhotoPart(name: "Frontal"),
    PhotoPart(name: "Trasera"),
    PhotoPart(name: "Izquierda"),
    PhotoPart(name: "Derecha"),
    PhotoPart(name: "Diagonal Izquierda-Derecha"),
    PhotoPart(name: "Diagonal Derecha-Izquierda"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Vehiculo"),
        ),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: photoParts
                      .map((photoPart) => ListTile(
                            title: Text(
                              photoPart.name,
                            ),
                            trailing: Icon(
                              photoPart.photo != null
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank_rounded,
                            ),
                            onTap: () async {
                              var partUpdated = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PhotoPanelControlPage(
                                              photoPart: photoPart)));

                              if (partUpdated == null) {
                                return;
                              }

                              setState(() {
                                photoPart.photo =
                                    (partUpdated as PhotoPart).photo;
                              });
                            },
                            dense: false,
                          ))
                      .toList()),
            ],
          ),
        ));
  }
}
