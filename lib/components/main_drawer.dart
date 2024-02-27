import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_driven_app/auth/authentication_cubit.dart';
import 'package:test_driven_app/components/loader_overlay.dart';
import 'package:test_driven_app/screens/home_page.dart';
import 'package:test_driven_app/screens/orders_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrdersPage()));
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
    );
  }
}
