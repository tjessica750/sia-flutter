// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:test_driven_app/components/main_drawer.dart';
import 'package:test_driven_app/components/revision_layout.dart';

class PaintingExamPage extends StatefulWidget {
  const PaintingExamPage({super.key});

  @override
  _PaintingExamPageState createState() => _PaintingExamPageState();
}

class _PaintingExamPageState extends State<PaintingExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("examen de pintura"),
        ),
        drawer: const MainDrawer(),
        body: RevisionLayout(
          onNext: () {},
          onPrevious: () {
            Navigator.pop(context);
          },
          title: "Examen de pintura",
          revisionNumber: 123,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 1,
                child: Wrap(
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
              ),
              const SizedBox(width: 20),
              Flexible(
                flex: 1,
                child: Wrap(
                  children: [
                    const Text(
                      "PUERTA",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    _buildCustomInput(
                      "BAUL",
                    ),
                    _buildCustomInput(
                      "TECHO",
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                flex: 1,
                child: Wrap(
                  children: [
                    const Text(
                      "GUARDAFANGO",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    _buildCustomInput(
                      "GDD",
                    ),
                    _buildCustomInput(
                      "GDI",
                    ),
                    _buildCustomInput(
                      "GTD",
                    ),
                    _buildCustomInput(
                      "GTI",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

Widget _buildCustomInput(String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          Text(
            "$label :",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 100,
            child: TextFormField(
              maxLines: 1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      )
      // Espacio adicional si no hay descripción
    ],
  );
}
