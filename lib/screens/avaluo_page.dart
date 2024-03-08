// ignore: file_names
import 'package:flutter/material.dart';
import 'package:test_driven_app/components/main_drawer.dart';
import 'package:test_driven_app/components/revision_layout.dart';
import 'package:test_driven_app/entities/job_order_entity.dart';
import 'package:test_driven_app/screens/photo_page.dart';

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
        body: RevisionLayout(
            onNext: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhotoPage(
                            order: widget.jobOrder,
                          )));
            },
            onPrevious: () {
              Navigator.pop(context);
            },
            title: "Avaluo",
            revisionNumber: widget.jobOrder.NumeroRevision,
            child: Column(
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
                        initialValue: widget.jobOrder.Marca,
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
                        initialValue: widget.jobOrder.Clase,
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
                      initialValue: widget.jobOrder.TipoCombustible,
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
                      initialValue: widget.jobOrder.Kilometraje.toString(),
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
                      initialValue: widget.jobOrder.CODFASECOLDA,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "COD.FASECOLDA",
                      ),
                    ))
                  ],
                ),
              ],
            )));
  }
}
