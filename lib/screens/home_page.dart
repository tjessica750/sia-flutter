import 'package:flutter/material.dart';
import 'package:test_driven_app/screens/diagnostic_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[DiagnosticPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("SIA de colombia")),
        body: Container(
          padding: const EdgeInsets.all(25),
          child: _widgetOptions[_selectedIndex],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(children: [
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
                ListTile(
                  title: const Text(
                    "Ordenes",
                    style: TextStyle(color: Colors.black87),
                  ),
                  leading: const Icon(Icons.toc, color: Colors.black87),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    "Cerrar Sesion",
                    style: TextStyle(color: Colors.black87),
                  ),
                  leading: const Icon(Icons.exit_to_app, color: Colors.black87),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ])
            ],
          ),
        ));
  }
}
