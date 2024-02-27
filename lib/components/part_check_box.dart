import 'package:flutter/material.dart';

class DiagnosticOption {
  final String name;
  final Color selectedColor;
  bool isSelected;

  DiagnosticOption(
      {required this.name,
      required this.selectedColor,
      required this.isSelected});
}

class CustomCheckboxGroup extends StatefulWidget {
  final List<DiagnosticOption> diagnosticOptions;
  final void Function(DiagnosticOption selectedValue)? onChange;

  const CustomCheckboxGroup(
      {super.key, required this.diagnosticOptions, this.onChange});

  @override
  // ignore: library_private_types_in_public_api
  _CustomCheckboxGroupState createState() => _CustomCheckboxGroupState();
}

class _CustomCheckboxGroupState extends State<CustomCheckboxGroup> {
  void _updateCheckboxValues(int index) {
    if (widget.onChange != null) {
      widget.onChange!(widget.diagnosticOptions[index]);
    }

    setState(() {
      for (int i = 0; i < widget.diagnosticOptions.length; i++) {
        if (i == index) {
          widget.diagnosticOptions[i].isSelected = true;
        } else {
          widget.diagnosticOptions[i].isSelected = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          for (int i = 0; i < widget.diagnosticOptions.length; i++)
            ElevatedButton(
              style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(
                      strokeAlign: 1,
                      width: 1,
                      color: Color(int.parse('0xFFE0E0F9')))),
                  minimumSize: MaterialStateProperty.all(const Size(100, 75)),
                  backgroundColor: MaterialStateProperty.all(
                      widget.diagnosticOptions[i].isSelected
                          ? widget.diagnosticOptions[i].selectedColor
                          : null),
                  padding:
                      MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0)))),
              onPressed: () {
                _updateCheckboxValues(i);
              },
              child: Text(widget.diagnosticOptions[i].name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }
}
