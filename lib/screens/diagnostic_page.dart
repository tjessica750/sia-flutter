// ignore: file_names
import 'package:flutter/material.dart';

class DiagnosticPage extends StatefulWidget {
  const DiagnosticPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DiagnosticPageState createState() => _DiagnosticPageState();
}

class _DiagnosticPageState extends State<DiagnosticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                    backgroundColor: MaterialStateProperty.all(
                        Color(int.parse('0xFFE0E0F9'))),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)))),
                onPressed: () {},
                child: const Text("Atras",
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(int.parse('0x8D93D2'))),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)))),
                onPressed: () {},
                child: const Text("Siguiente",
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          const Column(
            children: [
              Text(
                "Registro 3845967",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "NIT:  83455232525",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
            ],
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
        child: const Text("Fotografias del vehiculo",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      Container(
          padding: const EdgeInsets.all(30),
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
          child: const CarPhotos())
    ]));
  }
}

class CarPhotos extends StatefulWidget {
  const CarPhotos({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CarPhotos createState() => _CarPhotos();
}

class _CarPhotos extends State<CarPhotos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                padding: const EdgeInsets.only(right: 140, left: 140),
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
                child: SizedBox(
                  height: 220.0,
                  width: 220.0, // Altura de la imagen
                  child: Image.asset("assets/images/car.jpg"),
                )),
            Container(
                padding: const EdgeInsets.only(right: 140, left: 140),
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
                child: SizedBox(
                  height: 220.0,
                  width: 220.0, // Altura de la imagen
                  child: Image.asset("assets/images/car.jpg"),
                ))
          ],
        ),
        Row(
          children: [
            Container(
                padding: const EdgeInsets.only(right: 140, left: 140),
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
                child: SizedBox(
                  height: 220.0,
                  width: 220.0, // Altura de la imagen
                  child: Image.asset("assets/images/car.jpg"),
                )),
            Container(
                padding: const EdgeInsets.only(right: 140, left: 140),
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
                child: SizedBox(
                  height: 220.0,
                  width: 220.0, // Altura de la imagen
                  child: Image.asset("assets/images/car.jpg"),
                ))
          ],
        ),
      ],
    );
  }
}
