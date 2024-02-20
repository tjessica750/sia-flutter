import 'package:flutter/material.dart';
import 'package:test_driven_app/screens/photo_panel_control_page.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
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
        body: SafeArea(
      top: true,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              ListTile(
                title: const Text(
                  'Frontal',
                ),
                trailing: const Icon(
                  Icons.check_box,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhotoPanelControlPage()));
                },
                dense: false,
              ),
              ListTile(
                title: const Text(
                  'Trasera',
                ),
                trailing: const Icon(
                  Icons.check_box,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhotoPanelControlPage()));
                },
                dense: false,
              ),
              ListTile(
                title: const Text(
                  'Izquierda',
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhotoPanelControlPage()));
                },
                trailing: const Icon(
                  Icons.check_box,
                ),
                dense: false,
              ),
              ListTile(
                title: const Text(
                  'Derecha',
                ),
                trailing: const Icon(
                  Icons.check_box,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhotoPanelControlPage()));
                },
                dense: false,
              ),
              ListTile(
                title: const Text(
                  'Diagonal Izquierda-Derecha',
                ),
                trailing: const Icon(
                  Icons.check_box,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhotoPanelControlPage()));
                },
                dense: false,
              ),
              ListTile(
                title: const Text(
                  'Diagonal Derecha-Izquierda',
                ),
                trailing: const Icon(
                  Icons.check_box_outline_blank,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhotoPanelControlPage()));
                },
                dense: false,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
