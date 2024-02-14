// ignore: file_names
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
                decoration:
                    BoxDecoration(color: Color(int.parse('0xFFE0E0F9'))),
                children: const [
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("#", style: TextStyle(fontSize: 22)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Placa", style: TextStyle(fontSize: 22)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Cliente", style: TextStyle(fontSize: 22)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        Text("Tipo servicio", style: TextStyle(fontSize: 22)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Marca", style: TextStyle(fontSize: 22)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Acciones", style: TextStyle(fontSize: 22)),
                  ))
                ]),
            ...List.generate(
                20,
                (index) => TableRow(children: [
                      TableCell(
                        child: Container(
                          height: 65,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0), // Borde inferior
                            ),
                          ),
                          child: Text(
                            index.toString(),
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 65,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0), // Borde inferior
                            ),
                          ),
                          child: const Text(
                            "Honda",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 65,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0), // Borde inferior
                            ),
                          ),
                          child: const Text(
                            "Honda",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 65,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0), // Borde inferior
                            ),
                          ),
                          child: const Text(
                            "Honda",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 65,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0), // Borde inferior
                            ),
                          ),
                          child: const Text(
                            "Honda",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 65,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  iconSize: 30,
                                  onPressed: () {},
                                  icon: const Icon(Icons.start_sharp,
                                      color: Colors.green)),
                              IconButton(
                                  iconSize: 30,
                                  onPressed: () {},
                                  icon: const Icon(Icons.check_circle_outlined,
                                      color: Colors.redAccent))
                            ],
                          ),
                        ),
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
