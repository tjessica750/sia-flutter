import 'package:flutter/material.dart';

class PhotoPanelControlPage extends StatefulWidget {
  const PhotoPanelControlPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
          'assets/images/car.jpg',
        ),
      )),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 44, 16, 0),
                  child: IconButton.filled(
                      hoverColor: Colors.transparent,
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 30,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      }))
            ],
          )
        ],
      ),
    )));
  }
}
