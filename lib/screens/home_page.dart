import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_driven_app/auth/authentication_cubit.dart';
import 'package:test_driven_app/components/loader_overlay.dart';
import 'package:test_driven_app/screens/avaluo_page.dart';
import 'package:test_driven_app/screens/init_page.dart';
import 'package:test_driven_app/screens/orders_page.dart';
import 'package:test_driven_app/screens/photo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    InitPage(),
    OrdersPage(),
    PhotoPage(),
    AvaluoPage()
  ];

  @override
  void dispose() {
    super.dispose();
  }

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
                  setState(() {
                    _selectedIndex = 0;
                  });
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
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              ListTile(
                title: const Text(
                  "Fotos",
                  style: TextStyle(color: Colors.black87),
                ),
                leading: const Icon(Icons.photo_camera_back_outlined,
                    color: Colors.black87),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              ListTile(
                title: const Text(
                  "Avaluo",
                  style: TextStyle(color: Colors.black87),
                ),
                leading:
                    const Icon(Icons.assignment_add, color: Colors.black87),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
              ),
              ListTile(
                title: const Text(
                  "Cerrar Sesion",
                  style: TextStyle(color: Colors.black87),
                ),
                leading: const Icon(Icons.exit_to_app, color: Colors.black87),
                onTap: () async {
                  LoaderOverlay.show(context);
                  await context.read<AuthenticationCubit>().signOut();
                  LoaderOverlay.hide();
                },
              )
            ])
          ],
        ),
      ),
    );
  }
}
