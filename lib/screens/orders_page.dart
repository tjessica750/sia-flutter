import 'package:flutter/material.dart';
import 'package:test_driven_app/components/main_drawer.dart';
import 'package:test_driven_app/entities/job_order_entity.dart';
import 'package:test_driven_app/screens/avaluo_page.dart';
import 'package:test_driven_app/services/job_order_service.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late Iterable<JobOrderEntity> futureJobOrders = [];

  @override
  void initState() {
    super.initState();
    _getJobOrders();
  }

  _getJobOrders() async {
    var jobOrders = await fetchAllJobOrders();

    setState(() {
      futureJobOrders = jobOrders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ordenes")),
      drawer: const MainDrawer(),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          strokeAlign: 2,
                          color: Color(int.parse('0xFFE0E0F9')))),
                  labelText: "Buscar",
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(25),
              child: IconButton.filled(
                  iconSize: 40,
                  onPressed: () {},
                  icon: const Icon(Icons.search_rounded)),
            )
          ],
        ),
        Table(
          border: TableBorder(
              borderRadius: const BorderRadius.all(Radius.elliptical(50, 50)),
              horizontalInside: BorderSide(
                  strokeAlign: 2,
                  color: Color(int.parse('0xFFE0E0F9')),
                  width: 4),
              bottom: BorderSide(
                  strokeAlign: 2,
                  color: Color(int.parse('0xFFE0E0F9')),
                  width: 4),
              left: BorderSide(
                  strokeAlign: 2,
                  color: Color(int.parse('0xFFE0E0F9')),
                  width: 4),
              top: BorderSide(
                  strokeAlign: 2,
                  color: Color(int.parse('0xFFE0E0F9')),
                  width: 4),
              right: BorderSide(
                  strokeAlign: 2,
                  color: Color(int.parse('0xFFE0E0F9')),
                  width: 4)),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
                decoration: BoxDecoration(
                  color: Color(
                    int.parse('0xFFE0E0F9'),
                  ),
                ),
                children: const [
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("#",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Placa",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Cliente",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Tipo servicio",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Marca",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Acciones",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ))
                ]),
            ...futureJobOrders.map((jobOrder) => TableRow(children: [
                  TableCell(
                    child: Container(
                      height: 65,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.grey, width: 1.0), // Borde inferior
                        ),
                      ),
                      child: Text(
                        jobOrder.Id,
                        textAlign: TextAlign.center,
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
                              color: Colors.grey, width: 1.0), // Borde inferior
                        ),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        jobOrder.Placa,
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
                              color: Colors.grey, width: 1.0), // Borde inferior
                        ),
                      ),
                      child: Text(
                        jobOrder.Linea,
                        textAlign: TextAlign.center,
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
                              color: Colors.grey, width: 1.0), // Borde inferior
                        ),
                      ),
                      child: Text(
                        jobOrder.Estado,
                        textAlign: TextAlign.center,
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
                              color: Colors.grey, width: 1.0), // Borde inferior
                        ),
                      ),
                      child: Text(
                        jobOrder.Modelo,
                        textAlign: TextAlign.center,
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
                          bottom: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton.filled(
                              iconSize: 30,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AvaluoPage()));
                              },
                              icon: const Icon(Icons.start_sharp,
                                  color: Colors.green)),
                          IconButton.filled(
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
      ]),
    );
  }
}
