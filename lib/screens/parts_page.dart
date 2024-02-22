import 'package:flutter/material.dart';
import 'package:test_driven_app/components/main_drawer.dart';
import 'package:test_driven_app/components/part_check_box.dart';
import 'package:test_driven_app/entities/accessories_entity.dart';
import 'package:test_driven_app/entities/part_entity.dart';
import 'package:test_driven_app/screens/photo_page.dart';

class PartsPage extends StatefulWidget {
  const PartsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PartsPageState createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  late List<PartEntity> parts;
  late int currentPartIndex = 0;

  @override
  void initState() {
    super.initState();
    parts = List.generate(
        5,
        (index) => PartEntity(
            id: index,
            name: "parte_$index",
            accesories: List.generate(
                5,
                (index) =>
                    AccessorieEntity(id: index, name: "accesorio_$index"))));
  }

  void _updateCurrentPart(int index) {
    setState(() {
      currentPartIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario de partes")),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
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
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                  parts[currentPartIndex].name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton.filled(
                  onPressed: () {
                    if (currentPartIndex < parts.length - 1) {
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
              children: parts[currentPartIndex]
                  .accesories
                  .map(
                    (accesorie) => Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            accesorie.name,
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
                                  keyboardType: TextInputType.numberWithOptions(
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
    );
  }
}
