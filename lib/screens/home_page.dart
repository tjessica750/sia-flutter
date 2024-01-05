import 'package:flutter/material.dart';
import 'package:test_driven_app/screens/transactions/new_transaction_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[TransactionPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("SIA de colombia")),
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                width: 300,
                height: 865,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(children: [
                  DrawerHeader(
                    child: SizedBox(
                      height: 150.0,
                      width: 150.0, // Altura de la imagen
                      child: Image.asset("assets/images/logo-sia.png"),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Inicio",
                      style: TextStyle(color: Colors.black87),
                    ),
                    leading: const Icon(Icons.home, color: Colors.black87),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ExpansionTile(
                    title: const Text(
                      "Transaccion",
                      style: TextStyle(color: Colors.black87),
                    ),
                    leading:
                        const Icon(Icons.credit_card, color: Colors.black87),
                    children: [
                      ListTile(
                        title: const Text(
                          "Nueva",
                          style: TextStyle(color: Colors.black87),
                        ),
                        leading: const Icon(Icons.add, color: Colors.black87),
                        onTap: () {
                          _onItemTapped(0);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text(
                          "Órdenes de Trabajo",
                          style: TextStyle(color: Colors.black87),
                        ),
                        leading: const Icon(Icons.list, color: Colors.black87),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text(
                          "Pendientes",
                          style: TextStyle(color: Colors.black87),
                        ),
                        leading: const Icon(Icons.pending_actions,
                            color: Colors.black87),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text(
                          "Diagnostico",
                          style: TextStyle(color: Colors.black87),
                        ),
                        leading:
                            const Icon(Icons.assessment, color: Colors.black87),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text(
                          "Historial",
                          style: TextStyle(color: Colors.black87),
                        ),
                        leading:
                            const Icon(Icons.history, color: Colors.black87),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  ListTile(
                    title: const Text(
                      "Configuracion",
                      style: TextStyle(color: Colors.black87),
                    ),
                    leading: const Icon(Icons.settings, color: Colors.black87),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "Cerrar Sesion",
                      style: TextStyle(color: Colors.black87),
                    ),
                    leading:
                        const Icon(Icons.exit_to_app, color: Colors.black87),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
