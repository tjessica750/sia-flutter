import 'package:flutter/material.dart';
import 'package:test_driven_app/components/future_layout.dart';
import 'package:test_driven_app/components/main_drawer.dart';
import 'package:test_driven_app/components/part_check_box.dart';
import 'package:test_driven_app/entities/accessories_entity.dart';
import 'package:test_driven_app/entities/job_order_entity.dart';
import 'package:test_driven_app/entities/part_entity.dart';
import 'package:test_driven_app/screens/photo_page.dart';
import 'package:test_driven_app/services/accesorie_part.dart';
import 'package:test_driven_app/services/part_type_service.dart';

class PartsPage extends StatefulWidget {
  final JobOrderEntity order;

  const PartsPage({
    super.key,
    required this.order,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PartsPageState createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  late List<PartTypeEntity> partTypes = [];
  late List<AccessoriePartEntity> currentPartAccesories = [];
  late int currentPartIndex = 0;
  late Future<List<PartTypeEntity>> partTypesFuture;

  @override
  void initState() {
    super.initState();
    partTypesFuture = fetchPartTypes().then((value) {
      setState(() {
        partTypes = value;
      });

      return value;
    });
  }

  void _updateCurrentPart(int index) {
    setState(() {
      currentPartIndex = index;
      _getPartAccesories();
    });
  }

  void _getPartAccesories() async {
    PartTypeEntity? selectedPart = partTypes[currentPartIndex];

    // ignore: unnecessary_null_comparison
    if (selectedPart == null) {
      return;
    }

    List<AccessoriePartEntity> accesories =
        await fetchAccesorieParts(selectedPart.Id, widget.order.IdTipoVehiculo);

    setState(() {
      currentPartAccesories = accesories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Formulario de partes")),
        drawer: const MainDrawer(),
        body: FutureLayout(
          future: partTypesFuture,
          initialData: const [],
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(20.0)),
                            backgroundColor: MaterialStateProperty.all(
                                Color(int.parse('0xFFE0E0F9'))),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Atras",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(20.0)),
                            backgroundColor: MaterialStateProperty.all(
                                Color(int.parse('0x8D93D2'))),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PhotoPage()));
                        },
                        child: const Text("Siguiente",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  const Text(
                    "Revision #000001",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Color(int.parse('0xFFE0E0F9')),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        if (currentPartIndex > 0) {
                          _updateCurrentPart(currentPartIndex - 1);
                        }
                      },
                      icon: const Icon(Icons.navigate_before_rounded),
                    ),
                    Text(
                      partTypes.isNotEmpty
                          ? partTypes[currentPartIndex].Nombre
                          : "",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    IconButton.filled(
                      onPressed: () {
                        if (currentPartIndex < partTypes.length - 1) {
                          _updateCurrentPart(currentPartIndex + 1);
                        }
                      },
                      icon: const Icon(Icons.navigate_next_rounded),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: currentPartAccesories
                      .map(
                        (accesorie) => Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                accesorie.Nombre,
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 90,
                                    child: TextField(
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: false, signed: false),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Cant.",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  CustomCheckboxGroup(
                                    diagnosticOptions: [
                                      DiagnosticOption(
                                        isSelected: false,
                                        name: "B",
                                        selectedColor: const Color.fromARGB(
                                            255, 175, 233, 108),
                                      ),
                                      DiagnosticOption(
                                        isSelected: false,
                                        name: "R",
                                        selectedColor: Colors.lightBlueAccent,
                                      ),
                                      DiagnosticOption(
                                        isSelected: false,
                                        name: "M",
                                        selectedColor: Colors.redAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ]),
          ),
        ));
  }
}
