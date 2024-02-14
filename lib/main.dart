import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/login': (context) => const LoginPage()
        },
        theme: ThemeData(
            fontFamily: "Abel",
            useMaterial3: true,
            textTheme: const TextTheme(
                bodyLarge: TextStyle(fontSize: 20.0),
                displayLarge: TextStyle(fontSize: 20.0),
                bodyMedium: TextStyle(fontSize: 18.0),
                bodySmall: TextStyle(fontSize: 16.0),
                labelSmall: TextStyle(fontSize: 20.0),
                labelMedium: TextStyle(fontSize: 20.0),
                titleLarge: TextStyle(fontSize: 20.0),
                titleMedium: TextStyle(fontSize: 18.0)),
            drawerTheme: const DrawerThemeData(
                backgroundColor: Color.fromRGBO(255, 255, 255, 1)),
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color(int.parse('0xFFE0E0F9')))));
  }
}
