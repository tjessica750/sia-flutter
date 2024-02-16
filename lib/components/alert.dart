import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final String message;

  const Alert({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
          color: Color.fromARGB(250, 250, 217, 217),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.error_outline_outlined,
              color: Colors.red,
              fill: 0.5,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: Text(
              message,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.red[700], fontWeight: FontWeight.w100),
            ))
          ],
        ),
      ),
    );
  }
}
