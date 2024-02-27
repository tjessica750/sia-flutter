// ignore: file_names
import 'package:flutter/material.dart';
import 'package:test_driven_app/components/main_drawer.dart';
import 'package:test_driven_app/entities/job_order_entity.dart';
import 'package:test_driven_app/screens/parts_page.dart';

class AvaluoPage extends StatefulWidget {
  final JobOrderEntity jobOrder;

  const AvaluoPage({super.key, required this.jobOrder});

  @override
  // ignore: library_private_types_in_public_api
  _AvaluoPagePageState createState() => _AvaluoPagePageState();
}

class _AvaluoPagePageState extends State<AvaluoPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(title: const Text("Avaluo")),
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
                                  builder: (context) => PartsPage(
                                        order: widget.jobOrder,
                                      )));
                        },
                        child: const Text("Siguiente",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  Text(
                    "Revision #${widget.jobOrder.NumeroRevision.toString().padLeft(10, '0')}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
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
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: 2, color: Color(int.parse('0xFFE0E0F9'))),
                          bottom: BorderSide(
                              width: 2, color: Color(int.parse('0xFFE0E0F9'))),
                          left: BorderSide(
                              width: 2, color: Color(int.parse('0xFFE0E0F9'))),
                          right: BorderSide(
                              width: 2,
                              color: Color(int.parse('0xFFE0E0F9'))))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: AvaluoForm(jobOrder: widget.jobOrder),
                  ))
            ])));
  }
}

class AvaluoForm extends StatefulWidget {
  final JobOrderEntity jobOrder;

  const AvaluoForm({super.key, required this.jobOrder});

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
              initialValue: widget.jobOrder.Placa,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Placa",
              ),
            )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextFormField(
                initialValue: widget.jobOrder.Modelo,
                readOnly: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Marca",
                ),
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
              initialValue: widget.jobOrder.Linea,
              readOnly: true,
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
              initialValue: widget.jobOrder.Modelo,
              readOnly: true,
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
            Expanded(
              child: TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Clase",
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextFormField(
              initialValue: widget.jobOrder.TipoVehiculo,
              readOnly: true,
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
              initialValue: widget.jobOrder.Color,
              readOnly: true,
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
              readOnly: true,
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
              initialValue: widget.jobOrder.NumSerie,
              readOnly: true,
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
              initialValue: widget.jobOrder.NumMotor,
              readOnly: true,
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
              readOnly: true,
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
              readOnly: true,
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
