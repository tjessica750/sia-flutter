// ignore_for_file: library_private_types_in_public_api
import 'package:amplify_flutter/amplify_flutter.dart';
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
  _PartsPageState createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  List<PartTypeEntity> partTypes = [];
  int currentPartIndex = 0;
  Future<List<PartTypeEntity>> partTypesFuture = fetchPartTypes();
  bool isLoading = false;
  Map<int, List<AccessoriePartEntity>> accesories = {};
  Map<AccessoriePartEntity, Map<String, dynamic>> accesoriesFormData = {};

  @override
  void initState() {
    safePrint(widget.order);
    super.initState();
    partTypesFuture.then((value) {
      setState(() {
        partTypes = value;
        _getPartAccesories(currentPartIndex);
      });
    });
  }

  void _updateCurrentPart(int index) {
    setState(() {
      currentPartIndex = index;
      if (accesories[index] == null || accesories[index]!.isEmpty) {
        _getPartAccesories(index);
      }
      safePrint(accesoriesFormData);
    });
  }

  void _getPartAccesories(int index) async {
    PartTypeEntity selectedPart = partTypes[index];

    setState(() {
      isLoading = true;
    });

    List<AccessoriePartEntity> accesoriesFetched =
        await fetchAccesorieParts(selectedPart.Id, widget.order.IdTipoVehiculo);

    setState(() {
      isLoading = false;
      accesories[index] = accesoriesFetched;

      for (var accessory in accesoriesFetched) {
        accesoriesFormData[accessory] = {'quantity': 0, 'state': null};
      }
    });
  }

  bool _validateCurrentState(AccessoriePartEntity accesorie, String state) {
    return accesoriesFormData[accesorie]!["state"] == state;
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
          child: Column(
            children: [
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
                  Text(
                    "Revision #${widget.order.NumeroRevision.toString().padLeft(10, '0')}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                color: const Color(0xFFE0E0F9),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                        visible: currentPartIndex > 0,
                        child: IconButton.filled(
                          onPressed: () {
                            _updateCurrentPart(currentPartIndex - 1);
                          },
                          icon: const Icon(Icons.navigate_before_rounded),
                        )),
                    Text(
                      partTypes.isNotEmpty
                          ? partTypes[currentPartIndex].Nombre
                          : "",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Visibility(
                        visible: currentPartIndex < partTypes.length - 1,
                        child: IconButton.filled(
                          onPressed: () {
                            _updateCurrentPart(currentPartIndex + 1);
                          },
                          icon: const Icon(Icons.navigate_next_rounded),
                        )),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    if (isLoading)
                      const CircularProgressIndicator()
                    else if (accesories[currentPartIndex] == null ||
                        accesories[currentPartIndex]!.isEmpty)
                      const Text("No se encontraron datos para mostrar")
                    else
                      ...accesories[currentPartIndex]!.map((accessorie) {
                        return Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                accessorie.Nombre,
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 90,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        accesoriesFormData[accessorie]![
                                                "quantity"] =
                                            int.parse(
                                                value.isNotEmpty ? value : '0');
                                      },
                                      initialValue: accesoriesFormData[
                                              accessorie]!["quantity"]
                                          .toString(),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: false, signed: false),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Cant.",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  CustomCheckboxGroup(
                                    onChange: (selectedValue) {
                                      accesoriesFormData[accessorie]!["state"] =
                                          selectedValue.name;
                                    },
                                    diagnosticOptions: [
                                      DiagnosticOption(
                                        isSelected: _validateCurrentState(
                                            accessorie, "B"),
                                        name: "B",
                                        selectedColor: const Color.fromARGB(
                                            255, 175, 233, 108),
                                      ),
                                      DiagnosticOption(
                                        isSelected: _validateCurrentState(
                                            accessorie, "R"),
                                        name: "R",
                                        selectedColor: Colors.lightBlueAccent,
                                      ),
                                      DiagnosticOption(
                                        isSelected: _validateCurrentState(
                                            accessorie, "M"),
                                        name: "M",
                                        selectedColor: Colors.redAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
