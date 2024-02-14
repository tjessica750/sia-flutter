// ignore: file_names
import 'package:flutter/material.dart';
import 'package:test_driven_app/components/part_check_box.dart';
import 'package:test_driven_app/entities/accessories_entity.dart';
import 'package:test_driven_app/entities/part_entity.dart';

class AvaluoPage extends StatefulWidget {
  const AvaluoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AvaluoPagePageState createState() => _AvaluoPagePageState();
}

class _AvaluoPagePageState extends State<AvaluoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                    backgroundColor: MaterialStateProperty.all(
                        Color(int.parse('0xFFE0E0F9'))),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)))),
                onPressed: () {},
                child: const Text("Atras",
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(int.parse('0x8D93D2'))),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)))),
                onPressed: () {},
                child: const Text("Siguiente",
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
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
        padding: const EdgeInsets.all(20),
        color: Color(int.parse('0xFFE0E0F9')),
        width: double.infinity,
        child: const Text("Avaluo",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 2, color: Color(int.parse('0xFFE0E0F9'))),
                  bottom: BorderSide(
                      width: 2, color: Color(int.parse('0xFFE0E0F9'))),
                  left: BorderSide(
                      width: 2, color: Color(int.parse('0xFFE0E0F9'))),
                  right: BorderSide(
                      width: 2, color: Color(int.parse('0xFFE0E0F9'))))),
          child: const PartsForm())
    ]));
  }
}

class AvaluoForm extends StatefulWidget {
  const AvaluoForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AvaluoForm createState() => _AvaluoForm();
}

class _AvaluoForm extends State<AvaluoForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Placa",
              ),
            )),
            const SizedBox(
              width: 15,
            ),
            const Expanded(
              child: DropdownMenu(
                requestFocusOnTap: true,
                label: Text('Marca'),
                width: 530,
                dropdownMenuEntries: [],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Linea",
              ),
            )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Modelo",
              ),
            )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Expanded(
              child: DropdownMenu(
                requestFocusOnTap: true,
                label: Text('Clase'),
                width: 530,
                dropdownMenuEntries: [],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Tipo",
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Color",
              ),
            )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Combustible",
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Serie",
              ),
            )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Motor",
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Kilometraje",
              ),
            )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "COD.FASECOLDA",
              ),
            ))
          ],
        ),
      ],
    );
  }
}

class PartsForm extends StatefulWidget {
  const PartsForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PartsForm createState() => _PartsForm();
}

class _PartsForm extends State<PartsForm> {
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
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(20),
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
                icon: const Icon(Icons.navigate_before_rounded)),
            Text(parts[currentPartIndex].name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            IconButton.filled(
                onPressed: () {
                  if (currentPartIndex < parts.length - 1) {
                    _updateCurrentPart(currentPartIndex + 1);
                  }
                },
                icon: const Icon(Icons.navigate_next_rounded)),
          ],
        ),
      ),
      Container(
          padding: const EdgeInsets.all(20),
          height: 433,
          child: ListView(
            children: parts[currentPartIndex]
                .accesories
                .map((accesorie) => Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(accesorie.name,
                              style: const TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold)),
                          CustomCheckboxGroup(diagnosticOptions: [
                            DiagnosticOption(
                                isSelected: false,
                                name: "B",
                                selectedColor:
                                    const Color.fromARGB(255, 175, 233, 108)),
                            DiagnosticOption(
                                isSelected: false,
                                name: "R",
                                selectedColor: Colors.lightBlueAccent),
                            DiagnosticOption(
                                isSelected: false,
                                name: "M",
                                selectedColor: Colors.redAccent)
                          ])
                        ],
                      ),
                    ))
                .toList(),
          ))
    ]);
  }
}
