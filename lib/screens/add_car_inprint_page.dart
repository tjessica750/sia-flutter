import 'package:flutter/material.dart';
import 'package:test_driven_app/components/main_drawer.dart';
import 'package:test_driven_app/components/revision_layout.dart';
import 'package:test_driven_app/entities/job_order_entity.dart';
import 'package:test_driven_app/screens/parts_page.dart';
import 'package:test_driven_app/screens/photo_page.dart';
import 'package:test_driven_app/screens/photo_panel_control_page.dart';

class AddCarInprintPage extends StatefulWidget {
  final JobOrderEntity order;

  const AddCarInprintPage({super.key, required this.order});

  @override
  // ignore: library_private_types_in_public_api
  _AddCarInprintPageState createState() => _AddCarInprintPageState();
}

class _AddCarInprintPageState extends State<AddCarInprintPage> {
  final List<PhotoPart> photoParts = [
    PhotoPart(name: "Num. Motor"),
    PhotoPart(name: "Num. Armado"),
    PhotoPart(name: "Num. Seguridad"),
    PhotoPart(name: "Num. Chasis"),
    PhotoPart(name: "Num. Cabina"),
    PhotoPart(name: "Plaqueta serie"),
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
          title: const Text("Impronta"),
        ),
        drawer: const MainDrawer(),
        body: SafeArea(
          top: true,
          child: RevisionLayout(
              onNext: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PartsPage(
                              order: widget.order,
                            )));
              },
              onPrevious: () {
                Navigator.pop(context);
              },
              title: 'Fotografias Impronta',
              revisionNumber: widget.order.NumeroRevision,
              child: Column(
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
                      .toList())),
        ));
  }
}
