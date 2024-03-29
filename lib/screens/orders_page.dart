// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:test_driven_app/components/alert_dialog.dart';
import 'package:test_driven_app/components/future_layout.dart';
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
  late Iterable<JobOrderEntity> jobOrders = [];
  late Future<Iterable<JobOrderEntity>> jobOrderFuture;

  @override
  void initState() {
    super.initState();
    jobOrderFuture = fetchAllJobOrders().then((value) {
      setState(() {
        jobOrders = value;
      });

      return value;
    });
  }

  void _startOrder(BuildContext context, JobOrderEntity jobOrder) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AvaluoPage(
                  jobOrder: jobOrder,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ordenes")),
      drawer: const MainDrawer(),
      body: FutureLayout(
          future: jobOrderFuture,
          initialData: const [],
          child: ListView(padding: const EdgeInsets.all(20), children: [
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 50),
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
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(50, 50)),
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
                    children: [
                      _buildHeaderTableCell("#"),
                      _buildHeaderTableCell("Placa"),
                      _buildHeaderTableCell("Cliente"),
                      _buildHeaderTableCell("Tipo servicio"),
                      _buildHeaderTableCell("Tipo vehiculo"),
                      _buildHeaderTableCell("Marca"),
                      _buildHeaderTableCell("Acciones"),
                    ]),
                ...jobOrders
                    .toList()
                    .asMap()
                    .entries
                    .map((jobOrder) => TableRow(children: [
                          _buildCustomTableCell((jobOrder.key + 1).toString()),
                          _buildCustomTableCell(
                            jobOrder.value.Placa,
                          ),
                          _buildCustomTableCell(
                              "${jobOrder.value.ClienteNombre} ${jobOrder.value.ClienteApellido}"),
                          _buildCustomTableCell(
                            jobOrder.value.Estado,
                          ),
                          _buildCustomTableCell(
                            jobOrder.value.TipoVehiculo,
                          ),
                          _buildCustomTableCell(
                            jobOrder.value.Marca,
                          ),
                          _buildCustomActionCell(() {
                            AlertDialogUtil.showConfirmationDialog(
                                context,
                                "Confirmar",
                                "Quieres iniciar el diagnostico ?", () {
                              _startOrder(context, jobOrder.value);
                            });
                          }, () {}),
                        ]))
              ],
            ),
          ])),
    );
  }
}

Widget _buildCustomTableCell(String value) {
  return TableCell(
    child: Container(
      height: 65,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      child: Text(
        textAlign: TextAlign.center,
        value,
        style: const TextStyle(fontSize: 20.0),
      ),
    ),
  );
}

Widget _buildCustomActionCell(void Function() start, void Function() end) {
  return TableCell(
    child: Container(
      height: 65,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
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
              onPressed: start,
              icon: const Icon(Icons.start_sharp, color: Colors.green)),
          IconButton.filled(
              iconSize: 30,
              onPressed: end,
              icon: const Icon(Icons.check_circle_outlined,
                  color: Colors.redAccent))
        ],
      ),
    ),
  );
}

Widget _buildHeaderTableCell(String value) {
  return TableCell(
      child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text(value,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
  ));
}
