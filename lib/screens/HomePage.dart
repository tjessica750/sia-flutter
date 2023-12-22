import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: SideHomePage(),
    ));
  }
}

class SideHomePage extends StatefulWidget {
  const SideHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SideHomePageState createState() => _SideHomePageState();
}

class _SideHomePageState extends State<SideHomePage> {
  String _selectedOption = 'Inicio';

  void _selectOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Row(
              children: [
                // Sidebar
                Container(
                  width: 300.0,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 150.0,
                          width: 150.0, // Altura de la imagen
                          child: Image.asset("assets/images/logo-sia.png"),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Divider(),
                      _buildSidebarOption('Inicio', Icons.home),
                      const Divider(),
                      _buildTransactionOptions(),
                      const Divider(),
                      _buildSidebarOption('Configuración', Icons.settings),
                      const Spacer(),
                      const Divider(),
                      _buildSidebarOption('Cerrar Sesión', Icons.exit_to_app),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Contenido de $_selectedOption',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      _buildSidebarOption('Inicio', Icons.home),
                      _buildSidebarOption('Transacción', Icons.credit_card),
                      _buildSidebarOption('Configuración', Icons.settings),
                    ],
                  ),
                ),
                // Contenido
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Contenido de $_selectedOption',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildTransactionOptions() {
    return ExpansionTile(
      title: const Text('Transacción', style: TextStyle(color: Colors.black87)),
      leading: const Icon(Icons.credit_card, color: Colors.black87),
      children: [
        _buildSubOption('Nueva'),
        _buildSubOption('Órdenes de Trabajo'),
        _buildSubOption('Pendientes'),
        _buildSubOption('Diagnosticas'),
        _buildSubOption('Historial'),
      ],
    );
  }

  Widget _buildSubOption(String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black87),
      ),
      onTap: () => _selectOption(title),
    );
  }

  Widget _buildSidebarOption(String title, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black87),
      ),
      leading: Icon(icon, color: Colors.black87),
      onTap: () => _selectOption(title),
    );
  }
}
