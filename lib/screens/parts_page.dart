// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:test_driven_app/components/future_layout.dart';
import 'package:test_driven_app/components/main_drawer.dart';
import 'package:test_driven_app/components/part_check_box.dart';
import 'package:test_driven_app/components/revision_layout.dart';
import 'package:test_driven_app/entities/accessories_entity.dart';
import 'package:test_driven_app/entities/job_order_entity.dart';
import 'package:test_driven_app/entities/part_entity.dart';
import 'package:test_driven_app/screens/painting_exam_page.dart';
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
    super.initState();

    partTypesFuture.then((value) {
      setState(() {
        partTypes = value;
        _getPartAccesories(currentPartIndex);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateCurrentPart(int index) {
    setState(() {
      currentPartIndex = index;
      if (accesories[index] == null || accesories[index]!.isEmpty) {
        _getPartAccesories(index);
      }
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
        accesoriesFormData[accessory] = {'quantity': null, 'state': null};
      }
    });
  }

  bool _validateCurrentState(AccessoriePartEntity accesorie, String state) {
    return accesoriesFormData[accesorie]!["state"] == state;
  }

  bool _validateCompletedPartDiagnostic() {
    bool isCompleted = true;
    for (var accessory in accesories[currentPartIndex]!) {
      if (accesoriesFormData[accessory]?["quantity"] == null ||
          accesoriesFormData[accessory]?["state"] == null) {
        isCompleted = false;
        break;
      }
    }

    return isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario de partes")),
      drawer: const MainDrawer(),
      body: FutureLayout(
        future: partTypesFuture,
        initialData: const [],
        child: RevisionLayout(
          onNext: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaintingExamPage(
                          order: widget.order,
                        )));
          },
          onPrevious: () {
            Navigator.pop(context);
          },
          title: "Formulario de partes",
          revisionNumber: widget.order.NumeroRevision,
          child: Column(
            children: [
              Container(
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
                            _validateCompletedPartDiagnostic();

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
                                          ?.toString(),
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
