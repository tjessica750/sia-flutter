import 'package:flutter/material.dart';

class RevisionLayout extends StatelessWidget {
  final Widget child;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final String title;
  final int revisionNumber;

  const RevisionLayout(
      {super.key,
      required this.child,
      required this.onNext,
      required this.onPrevious,
      required this.title,
      required this.revisionNumber});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                      "Atras", Color(int.parse('0xFFE0E0F9')), onPrevious),
                  const SizedBox(
                    width: 20,
                  ),
                  _buildActionButton(
                      "Siguiente", Color(int.parse('0x8D93D2')), onNext),
                ],
              ),
              Text(
                "Revision #${revisionNumber.toString().padLeft(10, '0')}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
            child: Text(title,
                style: const TextStyle(
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
                          width: 2, color: Color(int.parse('0xFFE0E0F9'))))),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: child,
              ))
        ]));
  }
}

_buildActionButton(String title, Color color, void Function()? onPressed) {
  return ElevatedButton(
    style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)))),
    onPressed: onPressed,
    child: Text(title,
        style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
  );
}
