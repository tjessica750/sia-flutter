// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:test_driven_app/components/main_drawer.dart';
import 'package:test_driven_app/components/revision_layout.dart';
import 'package:test_driven_app/entities/job_order_entity.dart';

class PaintingExamPage extends StatefulWidget {
  final JobOrderEntity order;

  const PaintingExamPage({super.key, required this.order});

  @override
  _PaintingExamPageState createState() => _PaintingExamPageState();
}

class _PaintingExamPageState extends State<PaintingExamPage> {
  late int currentFormPartIndex = 0;
  late String title = "Examen de pintura";

  final List<Widget> formParts = [
    _buildPaintExamForm(),
    _buildTextArea(
      "Diagnostico pintura",
    ),
    _buildTextArea("Diagnostico AA"),
    _buildTextArea("Diagnostico Scanner"),
    _buildTextArea("Diagnostico Bateria"),
    _buildGeneralExam()
  ];

  _setCurrentFormPart(int index) {
    setState(() {
      currentFormPartIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("examen de pintura"),
        ),
        drawer: const MainDrawer(),
        body: RevisionLayout(
            onNext: () {
              if (currentFormPartIndex < formParts.length - 1) {
                _setCurrentFormPart(currentFormPartIndex + 1);
              }
            },
            onPrevious: () {
              if (currentFormPartIndex == 0) {
                return Navigator.pop(context);
              }

              _setCurrentFormPart(currentFormPartIndex - 1);
            },
            title: title,
            revisionNumber: widget.order.NumeroRevision,
            child: formParts[currentFormPartIndex]));
  }
}

Widget _buildCustomInput(String label) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            "$label :",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(10),
            width: 100,
            child: TextFormField(
              maxLines: 1,
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, signed: false),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      )
    ],
  );
}

Widget _buildPaintExamForm() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          const Text(
            "PUERTA",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _buildCustomInput("PDD"),
          const Text(
            "(Puerta delantera derecha)",
          ),
          _buildCustomInput("PDI"),
          const Text(
            "(Puerta delantera izquierda)",
          ),
          _buildCustomInput("PTD"),
          const Text(
            "(Puerta trasera derecha)",
          ),
          _buildCustomInput("PTI"),
          const Text(
            "(Puerta trasera izquierda)",
          ),
        ],
      ),
      Column(
        children: [
          const Text(
            "GUARDAFANGO",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _buildCustomInput(
            "GDD",
          ),
          const Text(
            "(guardafango delantero derecho)",
          ),
          _buildCustomInput(
            "GDI",
          ),
          const Text(
            "(guardafango delantero izquierdo)",
          ),
          _buildCustomInput(
            "GTD",
          ),
          const Text(
            "(guardafango trasero derecho)",
          ),
          _buildCustomInput(
            "GTI",
          ),
          const Text(
            "(guardafango trasero izquierdo)",
          ),
        ],
      ),
      Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          _buildCustomInput(
            "BAUL",
          ),
          const SizedBox(
            height: 25,
          ),
          _buildCustomInput(
            "TECHO",
          ),
          const SizedBox(
            height: 25,
          ),
          _buildCustomInput(
            "CAPÓ",
          ),
        ],
      )
    ],
  );
}

Widget _buildGeneralExam() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text(
                "Bateria",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildCustomInput("Vida util (%)")
            ],
          ),
          Column(children: [
            const Text(
              "Valor Sugerido",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildCustomInput("Valor sugerido"),
                _buildCustomInput("Valor asegurado")
              ],
            )
          ]),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        "Observaciones generales",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Expanded(child: _buildTextArea("Observaciones generales")),
        ],
      )
    ],
  );
}

Widget _buildTextArea(String hintText) {
  return SizedBox(
    height: 200,
    child: TextField(
      maxLines: null,
      minLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      expands: true,
    ),
  );
}
