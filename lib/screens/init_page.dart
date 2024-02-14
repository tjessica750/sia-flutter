// ignore: file_names
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400.0,
          width: 400.0, // Altura de la imagen
          child: Image.asset("assets/images/logo-sia.png"),
        ),
      ),
    );
  }
}
