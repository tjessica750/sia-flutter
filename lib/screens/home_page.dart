import 'package:flutter/material.dart';
import 'package:test_driven_app/components/main_drawer.dart';
import 'package:test_driven_app/screens/init_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: const InitPage(),
        ),
        drawer: const MainDrawer());
  }
}
